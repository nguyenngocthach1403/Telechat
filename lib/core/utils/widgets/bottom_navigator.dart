import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: Theme.of(context).primaryColor,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Ionicons.person,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Ionicons.people,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Ionicons.camera,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Ionicons.settings,
            ),
            label: ''),
      ],
    );
  }
}
