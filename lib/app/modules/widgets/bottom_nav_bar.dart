import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
    required this.pageNumber,
  });
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: pageNumber,
      destinations: [
        NavigationDestination(icon: Icon(Icons.email), label: 'Messages'),
        NavigationDestination(icon: Icon(Icons.call), label: 'Calls'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
