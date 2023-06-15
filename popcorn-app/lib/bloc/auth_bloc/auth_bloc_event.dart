import 'package:flutter/material.dart';

@immutable
abstract class AuthBlocEvent {}

class AuthUser extends AuthBlocEvent {
  AuthUser();
}
