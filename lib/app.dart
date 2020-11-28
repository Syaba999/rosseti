import 'package:flutter/material.dart';
import 'package:rosseti/config/theme.dart';

import 'config/routes.dart';
import 'services/injector_service.dart';
import 'services/navigator_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey:
          InjectorService.getInjector.get<NavigatorService>().navigatorKey,
      title: 'Россети',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.initialRoute,
    );
  }
}
