import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/auth/api_client.dart';
import 'package:project/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'package:project/bloc/auth_bloc/auth_bloc_event.dart';
import 'package:project/bloc/login/login_bloc.dart';
import 'package:project/ui/screens/error_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late ApiClient _apiClient;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool _isLoged;
  late TextEditingController _usernameController, _passwordController;

  @override
  void initState() {
    super.initState();
    _isLoged = false;
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _logginView();
  }

  Widget _logginView() {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {},
          child: _isLoged
              ? const Text("Log in", style: TextStyle(color: Colors.white))
              : const Text("Log out", style: TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }

  Widget _logginForm() {
    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Inicie Sesion",
                textAlign: TextAlign.center,
              )
            ],
            LabelFieldWidget(
              label: ,
            )));
  }
}

class LabelFieldWidget extends StatelessWidget {
  final Key? textFieldKey;
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  const LabelFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    this.textFieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.start,
          ),
          TextField(
            key: textFieldKey,
            obscureText: isPasswordField,
            obscuringCharacter: '*',
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
          ),
        ],
      ),
    );
  }
}
