import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:flutter/material.dart';

import 'auth/login/login_page.dart';
import 'splash/splash_page.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DW Barbershop',
        theme: BarbershopTheme.themeData,
        navigatorObservers: [asyncNavigatorObserver],
        routes: {
          '/': (_) => const SplashPage(),
          '/auth/login': (_) => const LoginPage(),
        },        
      );
    });
  }
}
