import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import 'pages/home.dart';
import 'pages/setup_flow.dart';
import 'routes.dart';
import 'pages/settings.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
  
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
          ),
        ),
        onGenerateRoute: (settings) {
          late Widget page;
          if (settings.name == routeHome) {
            page = const HomeScreen();
          } else if (settings.name == routeSettings) {
            page = const SettingsScreen();
          } else if (settings.name!.startsWith(routePrefixDeviceSetup)) {
            final subRoute =
                settings.name!.substring(routePrefixDeviceSetup.length);
            page = SetupFlow(
              setupPageRoute: subRoute,
            );
          } else {
            throw Exception('Unknown route: ${settings.name}');
          }

          return MaterialPageRoute<dynamic>(
            builder: (context) {
              return page;
            },
            settings: settings,
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    )
  );
}


