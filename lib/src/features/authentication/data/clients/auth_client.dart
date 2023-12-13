import 'package:http/http.dart' as http;

import '../../../../constants/api.dart';
import '../../../../exceptions/api_exception.dart';
import '../../../../utils/api/services/api_config_provider.dart';
import '../dtos/authenticated_user.dart';
import '../dtos/login.dart';
import '../dtos/user.dart';

class APIAuthClient {
  static final Uri _registerURL = Uri.parse(
      APIConfigurationProvider.configuration.baseURL +
          APIEndpointsConstants.loginEndpoint);
  static final Uri _loginURL = Uri.parse(
      APIConfigurationProvider.configuration.baseURL +
          APIEndpointsConstants.registerEndpoint);

  static Future<bool?> register(http.Client client, UserDTO userDTO) async {
    var response = await client.post(_registerURL,
        headers: APIConfigurationProvider.configuration.headers,
        body: userDTO.encodeToJson());

    if (response.statusCode == 201) {
      return true;
    } else {
      throw APIException(response: response);
    }
  }

  static Future<AuthenticatedUserDTO?> login(
      http.Client client, LoginDTO loginDTO) async {
    var reponse = await client.post(_loginURL,
        headers: APIConfigurationProvider.configuration.headers,
        body: loginDTO.encodeToJson());

    if (reponse.statusCode == 200) {
      return AuthenticatedUserDTO.decodeFromJson(reponse.body);
    } else {
      throw APIException(response: reponse);
    }
  }
}
