import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:go_router/go_router.dart';
import 'package:organaki_app/models/singleton_user.dart';
import 'package:organaki_app/modules/authentication/pages/login_page.dart';
import 'package:organaki_app/modules/authentication/pages/register_page.dart';
import 'package:organaki_app/modules/home/pages/home_main.dart';
import 'package:organaki_app/modules/home/pages/home_map_page.dart';
import 'package:organaki_app/modules/home/pages/home_orders_page.dart';
import 'package:organaki_app/modules/producer/pages/producer_apresentation_page.dart';
import 'package:organaki_app/modules/producer/pages/producer_edit_page.dart';
import 'package:organaki_app/modules/producer/pages/producer_account_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final route = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/map',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            const HomeMain(),
        routes: <RouteBase>[
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/map',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeMapPage()),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/order',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeOrdersPage()),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/account',
              redirect: (context, state) {
                if (SingletonUser().userAuth == null) {
                  return "/account/login";
                }
                return "/account/producerAccount";
              },
              routes: [
                GoRoute(
                    path: 'login',
                    builder: (BuildContext context, GoRouterState state) =>
                        const LoginPage()),
                GoRoute(
                    path: 'producerAccount',
                    builder: (BuildContext context, GoRouterState state) =>
                        const ProducerAccountPage()),
              ]),
        ],
      ),
      GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/register',
          builder: (BuildContext context, GoRouterState state) =>
              const RegisterPage()),
      GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/producerDetail',
          builder: (BuildContext context, GoRouterState state) {
            var params = state.extra as Map;
            String id = params["id"];
            var currentPosition = params["currentPosition"];
            MapController mapController = params["mapController"];
            MapOptions mapOptions = params["mapOptions"];

            return ProducerApresentationPage(
              mapController: mapController,
              mapOptions: mapOptions,
              currentPosition: currentPosition,
              id: id,
            );
          }),
    ]);
//TODO make a page thats show an error when not implemented yet or just call a rout that not exist
