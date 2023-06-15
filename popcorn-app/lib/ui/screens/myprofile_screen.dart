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

  @override
  void initState() {
    super.initState();
    _isLoged = false;
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
}
