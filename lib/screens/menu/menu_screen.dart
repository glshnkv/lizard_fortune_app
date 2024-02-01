import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/screens/win/win_screen.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';
import 'package:lizard_fortune_app/widgets/stroke_title_widget.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  final GameType type;

  const MenuScreen({super.key, required this.type});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: StrokeTitleWidget(
                  strokeColor: AppColors.darkorange,
                  textColor: AppColors.white,
                  text: 'Pause',
                  fontSize: 32,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child:
                          SvgPicture.asset('assets/images/elements/sound.svg'),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        context.router.push(SettingsRoute());
                      },
                      child: SvgPicture.asset(
                          'assets/images/elements/settings.svg'),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionButtonWidget(
                    strokeSize: 4,
                    color: AppColors.red,
                    strokeColor: AppColors.darkred,
                    text: 'Continue',
                    width: 240,
                    height: 55,
                    onTap: () {
                      switch (widget.type) {
                        case GameType.roulette:
                          context.router.push(RouletteRoute());
                        case GameType.slot:
                          context.router.push(SlotRoute());
                        case GameType.pokies:
                          context.router.push(PokiesRoute());
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  ActionButtonWidget(
                    strokeSize: 4,
                    color: AppColors.red,
                    strokeColor: AppColors.darkred,
                    text: 'To main',
                    width: 240,
                    height: 55,
                    onTap: () {
                      context.router.push(HomeRoute());
                    },
                  ),
                  SizedBox(height: 10),
                  ActionButtonWidget(
                    strokeSize: 4,
                    color: AppColors.red,
                    strokeColor: AppColors.darkred,
                    text: 'Exit',
                    width: 240,
                    height: 55,
                    onTap: () {
                      SystemChannels.platform
                          .invokeMethod<void>('SystemNavigator.pop');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
