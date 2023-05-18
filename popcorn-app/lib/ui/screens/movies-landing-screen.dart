import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MoviesLandingScreen extends StatefulWidget {
  const MoviesLandingScreen({super.key});

  @override
  State<MoviesLandingScreen> createState() => _MoviesLandingScreenState();
}

class _MoviesLandingScreenState extends State<MoviesLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _createLandingFullView(context));
  }

  Widget _createLandingFullView(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 90, bottom: 10, left: 30),
            child: const Text(
              'Top Rated',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(color: Colors.red))
      ],
    );
  }
}
