// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DailyRewardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DailyRewardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MenuRoute.name: (routeData) {
      final args = routeData.argsAs<MenuRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MenuScreen(
          key: args.key,
          type: args.type,
        ),
      );
    },
    PokiesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PokiesScreen(),
      );
    },
    RouletteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RouletteScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SlotRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SlotScreen(),
      );
    },
    SpotsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SpotsScreen(),
      );
    },
    WinRoute.name: (routeData) {
      final args = routeData.argsAs<WinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WinScreen(
          key: args.key,
          type: args.type,
          winAmount: args.winAmount,
        ),
      );
    },
  };
}

/// generated route for
/// [DailyRewardScreen]
class DailyRewardRoute extends PageRouteInfo<void> {
  const DailyRewardRoute({List<PageRouteInfo>? children})
      : super(
          DailyRewardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DailyRewardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    Key? key,
    required GameType type,
    List<PageRouteInfo>? children,
  }) : super(
          MenuRoute.name,
          args: MenuRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<MenuRouteArgs> page = PageInfo<MenuRouteArgs>(name);
}

class MenuRouteArgs {
  const MenuRouteArgs({
    this.key,
    required this.type,
  });

  final Key? key;

  final GameType type;

  @override
  String toString() {
    return 'MenuRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [PokiesScreen]
class PokiesRoute extends PageRouteInfo<void> {
  const PokiesRoute({List<PageRouteInfo>? children})
      : super(
          PokiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokiesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RouletteScreen]
class RouletteRoute extends PageRouteInfo<void> {
  const RouletteRoute({List<PageRouteInfo>? children})
      : super(
          RouletteRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouletteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SlotScreen]
class SlotRoute extends PageRouteInfo<void> {
  const SlotRoute({List<PageRouteInfo>? children})
      : super(
          SlotRoute.name,
          initialChildren: children,
        );

  static const String name = 'SlotRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SpotsScreen]
class SpotsRoute extends PageRouteInfo<void> {
  const SpotsRoute({List<PageRouteInfo>? children})
      : super(
          SpotsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpotsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WinScreen]
class WinRoute extends PageRouteInfo<WinRouteArgs> {
  WinRoute({
    Key? key,
    required GameType type,
    required int winAmount,
    List<PageRouteInfo>? children,
  }) : super(
          WinRoute.name,
          args: WinRouteArgs(
            key: key,
            type: type,
            winAmount: winAmount,
          ),
          initialChildren: children,
        );

  static const String name = 'WinRoute';

  static const PageInfo<WinRouteArgs> page = PageInfo<WinRouteArgs>(name);
}

class WinRouteArgs {
  const WinRouteArgs({
    this.key,
    required this.type,
    required this.winAmount,
  });

  final Key? key;

  final GameType type;

  final int winAmount;

  @override
  String toString() {
    return 'WinRouteArgs{key: $key, type: $type, winAmount: $winAmount}';
  }
}
