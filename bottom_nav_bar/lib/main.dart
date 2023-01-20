import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bottom_nav_bar/Screens/Screen1.dart';

import 'BottomNavBar/bottom_nav.dart';
import 'Screens/screen2.dart';
import 'Screens/screen3.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //int index = 0;
  int _actualScreen = 0;
  // ignore: non_constant_identifier_names
  final List<Widget> _screens = [Screen1(), Screen2(), Screen3()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      /*
      routes: {
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
        '/screen3': (context) => const Screen3(),
      },
      */
      home: Scaffold(
        appBar: AppBar(title: Text('Mi ejercicio')),
        body: _screens[_actualScreen],
        bottomNavigationBar: BottomNavigationBar(
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
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.android), label: 'Profile'),
          ],
          onTap: (int i) {
            setState(() {
              _actualScreen = i;
            });
            /*
        Navigator.pushReplacement(context, routes);
        */
          },
        ),
      ),
    );
  }
}


/*
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Center(child: Text('Hola')),
    );
  }
}
*/
