import '../utils/api/wrappers/api_config.dart';

class APIBaseURLConstants {
  static const String developmentBaseURL = 'http://127.0.0.1/5000/api';
  static const String productionBaseURL = 'http://127.0.0.1/5000/api';
}

class APIEndpointsConstants {
  static const String registerEndpoint = '/auth/register';
  static const String loginEndpoint = '/auth/login';

  static const String billEndpoint = '/bill';
  static const String billsEndpoint = '/bills';

  static const String itemEndpoint = '/item';
  static const String itemsEndpoint = '/items';
}

class APIHeadersConstants {
  static const Map<String, String> headers = {
    'Content-type': 'application/json', // Spécifiez le type de contenu JSON
    'Accept': 'application/json'
  };
}

class APIConfigurationsConstants {
  static const APIConfiguration developmentConfiguration = APIConfiguration(
      true,
      APIBaseURLConstants.developmentBaseURL,
      APIHeadersConstants.headers);
  static const APIConfiguration productionConfiguration = APIConfiguration(
      false,
      APIBaseURLConstants.productionBaseURL,
      APIHeadersConstants.headers);
}
