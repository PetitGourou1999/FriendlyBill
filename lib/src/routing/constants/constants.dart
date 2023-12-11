import 'package:flutter/material.dart';

import '../../features/bills/bill_page.dart';
import '../models/destination.dart';

class Paths {
  static const String activity = '/activity';
  static const String bills = '/bills';
  static const String account = '/account';
}

class AvailableDestinations {
  static const List<Destination> availableDestinations = <Destination>[
    Destination(0, 'Activity', Icons.format_list_bulleted, Paths.activity,
        MyHomePage(title: 'Activity')),
    Destination(
        1, 'Bills', Icons.receipt, Paths.bills, MyHomePage(title: 'Bills')),
    Destination(2, 'Account', Icons.account_circle, Paths.account,
        MyHomePage(title: 'Account')),
  ];
}
