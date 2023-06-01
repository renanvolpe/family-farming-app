part of 'register_user_bloc.dart';

@immutable
abstract class RegisterUserState {}

class RegisterUserInitial extends RegisterUserState {}
class RegisterUserProgress extends RegisterUserState {}
class RegisterUserSuccess extends RegisterUserState {}
class RegisterUserFailure extends RegisterUserState {}
