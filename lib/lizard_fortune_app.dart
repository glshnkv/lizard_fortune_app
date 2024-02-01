import 'package:flutter/material.dart';
import 'package:lizard_fortune_app/router/router.dart';

class LizardFortuneApp extends StatelessWidget {
  LizardFortuneApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'GT Eesti Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
