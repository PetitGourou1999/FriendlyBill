import 'package:flutter_test/flutter_test.dart';
import 'package:friendly_bill/src/constants/api.dart';
import 'package:friendly_bill/src/exceptions/api_exception.dart';
import 'package:friendly_bill/src/features/authentication/data/clients/auth_client.dart';
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
  final Uri loginURL = Uri.parse(
      APIConfigurationProvider.configuration.baseURL +
          APIEndpointsConstants.registerEndpoint);

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
          throwsA(predicate((e) => e is APIException)));
    });
  });
}
