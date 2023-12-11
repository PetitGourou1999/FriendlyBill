import 'package:flutter/material.dart';

import '../../features/account/presentation/account_page.dart';
import '../../features/bills/presentation/bills_page.dart';
import '../../features/bills/presentation/latest_page.dart';
import '../models/destination.dart';

class Paths {
  static const String activity = '/activity';
  static const String bills = '/bills';
  static const String account = '/account';
}

class AvailableDestinations {
  static const List<Destination> availableDestinations = <Destination>[
    Destination(0, 'Activity', Icons.format_list_bulleted, Paths.activity,
        LatestPage()),
    Destination(1, 'Bills', Icons.receipt, Paths.bills, BillsPage()),
    Destination(
        2, 'Account', Icons.account_circle, Paths.account, AccountPage()),
  ];
}
