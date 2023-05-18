import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFE62F16)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 85.0, vertical: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/path_logo.png',
                width: 225,
                height: 130,
              ),
              const Text('Beautiful, Private Sharing',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(253, 160, 134, 1))),
              const SizedBox(
                height: 130,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color(0xFFE62F16),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Already have a path account?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(253, 160, 134, 1)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE62F16),
                      side: const BorderSide(
                          width: 1.0, color: Color.fromRGBO(253, 160, 134, 1))),
                  onPressed: () {},
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        color: Color.fromRGBO(253, 160, 134, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("By using Path, you agree to Path's",
                  style: TextStyle(color: Color.fromRGBO(253, 160, 134, 1))),
              RichText(
                  text: const TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'and',
                        style:
                            TextStyle(color: Color.fromRGBO(253, 160, 134, 1))),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    )
                  ]))
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
