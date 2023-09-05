import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_nav_global_key.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/barbershop_register_page.dart';
import 'package:dw_barbershop/src/features/auth/register/user/user_register_page.dart';
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
        navigatorKey: BarbershopNavGlobalKey.instance.navKey,
        navigatorObservers: [asyncNavigatorObserver],
        routes: {
          '/': (_) => const SplashPage(),
          '/auth/login': (_) => const LoginPage(),
          '/auth/register/user': (_) => const UserRegisterPage(),
          '/auth/register/barbershop': (_) => const BarbershopRegisterPage(),
          '/home/adm': (_) => const Text('ADM'),
          '/home/employee': (_) => const Text('Employee'),
        },        
      );
    });
  }
}
