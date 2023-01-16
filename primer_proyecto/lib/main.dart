import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  /*
  const HelloWorld({Key? key}) : super(key: key);
  */

  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(

        // Scaffold Widget
        home: Scaffold(
      appBar: AppBar(
        // AppBar takes a Text Widget in it's title parameter
        title: const Center(child: Text('Antonio Montero')),
      ),
      body: const Center(child: Text('Hello Worldo')),
    ));
  }
}
