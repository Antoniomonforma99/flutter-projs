// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bottom_nav_bar/Screens/screen1.dart';
import 'package:bottom_nav_bar/Screens/screen2.dart';
import 'package:bottom_nav_bar/Screens/screen3.dart';

class BottomNav extends StatefulWidget {
  int _actualScreen = 0;

  BottomNav(int actualScreen);
  @override
  State<BottomNav> createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _actualScreen = 0;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _actualScreen,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.black,
      iconSize: 27.0,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(icon: Icon(Icons.android), label: 'Profile'),
      ],
      onTap: (int i) {
        setState(() {
          index = i;
        });
        /*
        Navigator.pushReplacement(context, routes);
        */
      },
    );
  }
}
