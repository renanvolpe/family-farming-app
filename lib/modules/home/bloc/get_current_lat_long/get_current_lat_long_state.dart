part of 'get_current_lat_long_bloc.dart';

@immutable
abstract class GetCurrentLatLongState {}

class GetCurrentLatLongInitial extends GetCurrentLatLongState {}

class GetCurrentLatLongProgress extends GetCurrentLatLongState {}

class GetCurrentLatLongSuccess extends GetCurrentLatLongState {}

class GetCurrentLatLongFailure extends GetCurrentLatLongState {}
