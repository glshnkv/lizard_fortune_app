import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lizard_fortune_app/screens/daily_reward/daily_reward_screen.dart';
import 'package:lizard_fortune_app/screens/games/pokies/pokies_screen.dart';
import 'package:lizard_fortune_app/screens/games/roulette/roulette_screen.dart';
import 'package:lizard_fortune_app/screens/games/slot/slot_screen.dart';
import 'package:lizard_fortune_app/screens/home/home_screen.dart';
import 'package:lizard_fortune_app/screens/menu/menu_screen.dart';
import 'package:lizard_fortune_app/screens/settings/settings_screen.dart';
import 'package:lizard_fortune_app/screens/spots/spots_screen.dart';
import 'package:lizard_fortune_app/screens/win/win_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: DailyRewardRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: SpotsRoute.page),
    AutoRoute(page: RouletteRoute.page),
    AutoRoute(page: MenuRoute.page),
    AutoRoute(page: WinRoute.page),
    AutoRoute(page: PokiesRoute.page),
    AutoRoute(page: SlotRoute.page),

  ];
}