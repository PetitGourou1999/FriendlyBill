import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../wrappers/destination.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage(
      {super.key, required this.allDestinations, required this.child});

  final List<Destination> allDestinations;
  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.child.currentIndex,
        onDestinationSelected: (int index) {
          widget.child.goBranch(index,
              initialLocation: index == widget.child.currentIndex);
          setState(() {});
        },
        destinations: widget.allDestinations.map((Destination destination) {
          return NavigationDestination(
            icon: Icon(destination.icon),
            label: destination.title,
          );
        }).toList(),
      ),
    );
  }
}
