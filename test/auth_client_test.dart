import 'package:flutter_test/flutter_test.dart';
import 'package:friendly_bill/src/constants/api.dart';
import 'package:friendly_bill/src/exceptions/api_exception.dart';
import 'package:friendly_bill/src/features/authentication/data/clients/auth_client.dart';
import 'package:friendly_bill/src/features/authentication/data/dtos/authenticated_user.dart';
import 'package:friendly_bill/src/features/authentication/data/dtos/login.dart';
import 'package:friendly_bill/src/features/authentication/data/dtos/user.dart';
import 'package:friendly_bill/src/utils/api/services/api_config_provider.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_client_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  APIConfigurationProvider.instance;

  group('register', () {
    final Uri registerURL = Uri.parse(
        APIConfigurationProvider.configuration.baseURL +
            APIEndpointsConstants.loginEndpoint);

    final UserDTO userDTO =
        UserDTO('John', 'Doe', 'john.doe@gmail.com', 'MyPassword123');

    test('Returns true if the user has been registered successfully', () async {
      final client = MockClient();

      when(client.post(registerURL,
              headers: APIConfigurationProvider.configuration.headers,
              body: userDTO.encodeToJson()))
          .thenAnswer((_) async => http.Response('{}', 201));

      expect(await APIAuthClient.register(client, userDTO), isTrue);
    });

    test('Throws an APIException if the HTTP call completes with an Error',
        () async {
      final client = MockClient();

      when(client.post(registerURL,
              headers: APIConfigurationProvider.configuration.headers,
              body: userDTO.encodeToJson()))
          .thenAnswer((_) async => http.Response('{"message": "Error"}', 400));

      expect(APIAuthClient.register(client, userDTO),
          throwsA(predicate((e) => e is APIException && e.message == 'Error')));
    });
  });

  group('login', () {
    final Uri loginURL = Uri.parse(
        APIConfigurationProvider.configuration.baseURL +
            APIEndpointsConstants.registerEndpoint);

    final LoginDTO loginDTO =
        LoginDTO(email: 'john.doe@gmail.com', password: 'MyPassword123');

    test(
        'Returns the user and the token if the user has logged in successfully',
        () async {
      final client = MockClient();

      when(client.post(loginURL,
              headers: APIConfigurationProvider.configuration.headers,
              body: loginDTO.encodeToJson()))
          .thenAnswer((_) async => http.Response(
              '{"token" :"1234567890abcdef", "user": {"firstname": "John", "surname": "Doe", "email": "john.doe@gmail.com"}}',
              200));

      expect(await APIAuthClient.login(client, loginDTO),
          isA<AuthenticatedUserDTO>());
    });

    test('Throws an APIException if the HTTP call completes with an Error',
        () async {
      final client = MockClient();

      when(client.post(loginURL,
              headers: APIConfigurationProvider.configuration.headers,
              body: loginDTO.encodeToJson()))
          .thenAnswer((_) async => http.Response('{"message": "Error"}', 400));

      expect(APIAuthClient.login(client, loginDTO),
          throwsA(predicate((e) => e is APIException && e.message == 'Error')));
    });
  });
}
