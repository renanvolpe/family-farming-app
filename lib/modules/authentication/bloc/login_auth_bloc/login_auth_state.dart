part of 'login_auth_bloc.dart';

@immutable
abstract class LoginAuthState {}

class LoginAuthInitial extends LoginAuthState {}
class LoginAuthProgress extends LoginAuthState {}
class LoginAuthSuccess extends LoginAuthState {}
class LoginAuthFailure extends LoginAuthState {}
