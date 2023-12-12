import 'package:flutter/foundation.dart';

import '../../../constants/api.dart';
import '../beans/api_config.dart';

class APIConfigurationProvider {
  static late final APIConfiguration configuration;

  static final APIConfigurationProvider _instance =
      APIConfigurationProvider._internal();

  static APIConfigurationProvider get instance => _instance;
  factory APIConfigurationProvider() {
    return _instance;
  }

  APIConfigurationProvider._internal() {
    if (kReleaseMode) {
      configuration = APIConfigurationsConstants.productionConfiguration;
    } else {
      configuration = APIConfigurationsConstants.developmentConfiguration;
    }
  }
}
