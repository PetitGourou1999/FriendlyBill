import 'package:flutter/material.dart';
import 'package:friendly_bill/src/features/bills/bill_page.dart';

import 'destination.dart';
import 'destination_view.dart';

/// Flutter code sample for [NavigationBar] with nested [Navigator] destinations.

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin<Home> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Activity', Icons.format_list_bulleted,
        MyHomePage(title: 'Activity')),
    Destination(1, 'Bills', Icons.receipt, MyHomePage(title: 'Bills')),
    Destination(
        2, 'Account', Icons.account_circle, MyHomePage(title: 'Account')),
  ];

  late final List<GlobalKey<NavigatorState>> navigatorKeys;
  late final List<Widget> destinationViews;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();
    destinationViews = allDestinations.map((Destination destination) {
      return Scaffold(
        body: DestinationView(
          destination: destination,
          navigatorKey: navigatorKeys[destination.index],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPop: () {
        final NavigatorState navigator =
            navigatorKeys[selectedIndex].currentState!;
        navigator.pop();
      },
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: allDestinations.map((Destination destination) {
              final int index = destination.index;
              final Widget view = destinationViews[index];
              if (index == selectedIndex) {
                return Offstage(offstage: false, child: view);
              } else {
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: allDestinations.map((Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon),
              label: destination.title,
            );
          }).toList(),
        ),
      ),
    );
  }
}
