import 'package:bottom_nav_bar/Screens/Screen1.dart';
import 'package:flutter/material.dart';

import 'BottomNavBar/bottom_nav.dart';
import 'Screens/screen2.dart';
import 'Screens/screen3.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
        '/screen3': (context) => const Screen3(),
      },
    );
  }
}

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
