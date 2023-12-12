import '../utils/api/beans/api_config.dart';

class APIBaseURLConstants {
  static const String developmentBaseURL = 'http://127.0.0.1/5000/api';
  static const String productionBaseURL = 'http://127.0.0.1/5000/api';
}

class APIEndpointsConstants {
  static const String authEndpoint = '/auth';

  static const String billEndpoint = '/bill';
  static const String billsEndpoint = '/bills';

  static const String itemEndpoint = '/item';
  static const String itemsEndpoint = '/items';
}

class APIConfigurationsConstants {
  static const APIConfiguration developmentConfiguration =
      APIConfiguration(true, APIBaseURLConstants.developmentBaseURL);
  static const APIConfiguration productionConfiguration =
      APIConfiguration(false, APIBaseURLConstants.productionBaseURL);
}
