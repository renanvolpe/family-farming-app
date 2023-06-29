import 'package:flutter/material.dart';
import 'package:organaki_app/core/routes.dart';
import 'package:organaki_app/modules/authentication/bloc/bloc_register_user/register_user_bloc.dart';
import 'package:organaki_app/modules/authentication/bloc/login_auth_bloc/login_auth_bloc.dart';
import 'package:organaki_app/modules/home/bloc/bloc_get_a_producer/get_a_producer_bloc.dart';
import 'package:organaki_app/modules/home/bloc/bloc_get_list_producer/get_list_producers_bloc.dart';
import 'package:organaki_app/services/authentication_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaki_app/services/producer_services.dart';

void main() {
  //REPOSITORIES THAT WILL BE USED
  var authRepo = AuthenticationRepository();
  var prodRepo = ProducerRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginAuthBloc(authRepo),
      ),
      BlocProvider(
        create: (context) => GetListProducersBloc(prodRepo),
      ),
      BlocProvider(
        create: (context) => RegisterUserBloc(authRepo),
      ),
      BlocProvider(
        create: (context) => GetAProducerBloc(prodRepo),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: route,
      theme: ThemeData(useMaterial3: true),
    ),
  ));
}
