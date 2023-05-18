import 'package:flutter/material.dart';
import 'package:project/ui/screens/actors-screen.dart';
import 'package:project/ui/screens/myprofile_screen.dart';
import 'package:project/ui/screens/search-screen.dart';

import 'movies-landing-screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    MoviesLandingScreen(),
    ActorsScreen(),
    SearchScreen(),
    MyProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(bodySmall: const TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_rounded), label: 'Movies'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_rounded), label: 'Actors'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_accessibility_rounded),
                label: 'My Profile'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
        ),
      ),
      floatingActionButton: const FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: null,
          child: Icon(Icons.search_rounded)),
    );
  }
}
