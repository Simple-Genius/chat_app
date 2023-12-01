import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
  });
  var RouteList = [];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.email), label: 'Messages'),
        NavigationDestination(icon: Icon(Icons.call), label: 'Calls'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
