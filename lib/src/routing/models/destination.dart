import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.route, this.page);
  final int index;
  final String title;
  final IconData icon;
  final String route;
  final Widget page;
}
