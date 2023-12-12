import 'package:flutter/material.dart';

import '../features/account/ui/account_page.dart';
import '../features/bills/ui/bills_page.dart';
import '../features/bills/ui/latest_page.dart';
import '../utils/routing/beans/destination.dart';

class RoutesConstants {
  static const String activity = '/activity';
  static const String bills = '/bills';
  static const String account = '/account';
}

class DestinationsConstants {
  static const activites = Destination(0, 'Activity',
      Icons.format_list_bulleted, RoutesConstants.activity, LatestPage());
  static const bills = Destination(
      1, 'Bills', Icons.receipt, RoutesConstants.bills, BillsPage());
  static const account = Destination(2, 'Account', Icons.account_circle,
      RoutesConstants.account, AccountPage());

  static const List<Destination> availableDestinations = <Destination>[
    DestinationsConstants.activites,
    DestinationsConstants.bills,
    DestinationsConstants.account
  ];
}
