import 'package:flutter/material.dart';
import 'package:organaki_app/modules/authentication/bloc/login_auth_bloc/login_auth_bloc.dart';
import 'package:organaki_app/modules/home/bloc/bloc_get_list_producer/get_list_producers_bloc.dart';
import 'package:organaki_app/modules/home/pages/home_main.dart';
import 'package:organaki_app/services/authentication_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaki_app/services/producer_services.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginAuthBloc(AuthenticationRepository()),
      ),
      BlocProvider(
        create: (context) => GetListProducersBloc(ProducerRepository()),
      ),
    ],
    child: MaterialApp(
      home: const HomeMain(),
      theme: ThemeData(useMaterial3: true),
    ),
  ));
}
