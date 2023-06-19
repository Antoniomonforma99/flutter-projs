part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LogoutSuccess extends LoginState {}

class LoginLoadin extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
