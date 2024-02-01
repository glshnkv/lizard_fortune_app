import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';
import 'package:lizard_fortune_app/widgets/stroke_title_widget.dart';

enum GameType {
  roulette,
  slot,
  pokies,
}

@RoutePage()
class WinScreen extends StatefulWidget {
  final GameType type;
  final int winAmount;

  const WinScreen({super.key, required this.type, required this.winAmount});

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.type == GameType.roulette
                ? "assets/images/win/win-roulette.png"
                : widget.type == GameType.slot
                    ? "assets/images/win/win-slot.png"
                    : "assets/images/win/win-pokies.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.type == GameType.roulette
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StrokeTitleWidget(
                            strokeColor: AppColors.darkorange,
                            textColor: AppColors.white,
                            text: 'Spot Roulette',
                            fontSize: 32),
                        SizedBox(height: 25),
                        Image.asset('assets/images/win/mini-roulette.png'),
                      ],
                    )
                  : widget.type == GameType.slot
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StrokeTitleWidget(
                                strokeColor: AppColors.darkorange,
                                textColor: AppColors.white,
                                text: 'Spot Slot',
                                fontSize: 32),
                            SizedBox(height: 25),
                            Image.asset('assets/images/win/mini-slot.png'),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StrokeTitleWidget(
                                strokeColor: AppColors.darkorange,
                                textColor: AppColors.white,
                                text: 'Spot Pokies',
                                fontSize: 32),
                            SizedBox(height: 25),
                            Image.asset('assets/images/win/mini-pokies.png'),
                          ],
                        ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      StrokeTitleWidget(
                          strokeColor: AppColors.yellow,
                          textColor: AppColors.titlered,
                          text: 'you win'.toUpperCase(), fontSize: 32),
                      Text(
                        '${widget.winAmount}',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkorange),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Column(
                    children: [
                      ActionButtonWidget(
                        strokeSize: 4,
                        color: AppColors.red,
                        strokeColor: AppColors.darkred,
                        text: 'Play again',
                        width: 140,
                        height: 55,
                        onTap: () {
                          switch (widget.type) {
                            case GameType.roulette:
                              context.router.push(RouletteRoute());
                            case GameType.pokies:
                              context.router.push(PokiesRoute());
                            case GameType.slot:
                              context.router.push(SlotRoute());
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      ActionButtonWidget(
                        strokeSize: 4,
                        color: AppColors.red,
                        strokeColor: AppColors.darkred,
                        text: 'Main menu',
                        width: 140,
                        height: 55,
                        onTap: () {
                          context.router.push(HomeRoute());
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/images/win/win-column.png', height: 330,),
            ],
          ),
        ),
      ),
    );
  }
}
