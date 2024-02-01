import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizard_fortune_app/lizard_fortune_app.dart';
import 'package:lizard_fortune_app/screens/daily_reward/bloc/daily_reward_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DailyRewardBloc>(
          create: (context) => DailyRewardBloc()),
    ],
    child: LizardFortuneApp(),
  ));
}
