import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/screens/win/win_screen.dart';
import 'package:lizard_fortune_app/services/shared_preferences.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';

@RoutePage()
class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key});

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  StreamController<int> controller = StreamController<int>();

  @override
  void initState() {
    getBalance();
    super.initState();
  }

  int balance = 0;
  int bet = 0;
  int win = 0;

  final items = <String>[
    'assets/images/games-elements/1.png',
    '20',
    '0',
    'assets/images/games-elements/3.png',
    'assets/images/games-elements/2.png',
    '0',
    'assets/images/games-elements/3.png',
    '10000',
    'assets/images/games-elements/2.png',
    '100',
    'assets/images/games-elements/1.png',
    '500',
  ];

  void getBalance() async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    setState(() {
      balance = storage.coins;
    });
  }

  void increment() {
    setState(() {
      if (balance > 40) {
        balance -= 40;
        bet += 40;
      }
    });
  }

  void decrement() {
    setState(() {
      if (bet > 0) {
        balance += 40;
        bet -= 40;
      }
    });
  }

  void onSpinEnd(int result) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    switch (result) {
      case 0:
        storage.coins += bet * 10;
        win = bet * 10;
      case 1:
        storage.coins += bet + 20;
        win = 20;
      case 2:
        storage.coins += bet + 0;
        win = 0;
      case 3:
        storage.coins += bet * 15;
        win = bet * 15;
      case 4:
        storage.coins += bet * 30;
        win = bet * 30;
      case 5:
        storage.coins += bet + 0;
        win = 0;
      case 6:
        storage.coins += bet * 15;
        win = bet * 15;
      case 7:
        storage.coins += bet + 10000;
        win = 10000;
      case 8:
        storage.coins += bet * 30;
        win = bet * 30;
      case 9:
        storage.coins += bet + 100;
        win = 100;
      case 10:
        storage.coins += bet * 10;
        win = bet * 10;
      case 11:
        storage.coins += bet + 500;
        win = 500;
    }
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/roulette/bg-roulette.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 330,
                      width: 250,
                      child: Stack(
                        children: [
                          Image.asset(
                              'assets/images/games-elements/column.png'),
                          Align(
                            alignment: Alignment(0, -0.6),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'BET',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: AppColors.darkorange,
                                  ),
                                ),
                                Text(
                                  '${bet}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/images/roulette/circal-bg.svg'),
                        Container(
                          height: 275,
                          width: 275,
                          child: FortuneWheel(
                            physics: NoPanPhysics(),
                            animateFirst: false,
                            selected: controller.stream,
                            items: [
                              for (var i in items)
                                i.length < 10
                                    ? FortuneItem(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 80),
                                            Text(
                                              i,
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        style: FortuneItemStyle(
                                          color: AppColors.itemcream,
                                          borderColor: AppColors.darkorange,
                                          borderWidth: 5,
                                        ),
                                      )
                                    : FortuneItem(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 80),
                                            Image.asset(
                                              i,
                                              width: 35,
                                            ),
                                          ],
                                        ),
                                        style: FortuneItemStyle(
                                          color: AppColors.itemcream,
                                          borderColor: AppColors.darkorange,
                                          borderWidth: 5,
                                        ),
                                      ),
                            ],
                            indicators: <FortuneIndicator>[
                              FortuneIndicator(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    'assets/images/roulette/indicator.svg'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 210,
                          child: Stack(
                            children: [
                              Image.asset(
                                  'assets/images/games-elements/balance.png'),
                              Align(
                                alignment: Alignment(0.1, 0.4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'BALANCE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.darkorange,
                                      ),
                                    ),
                                    Text(
                                      '${balance}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                decrement();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/games-elements/minus.svg'),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                increment();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/games-elements/plus.svg'),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ActionButtonWidget(
                          strokeSize: 2,
                          color: AppColors.orange,
                          strokeColor: AppColors.darkorange,
                          text: 'SPIN',
                          width: 170,
                          height: 45,
                          onTap: () async {
                            SharedPreferencesService storage =
                                await SharedPreferencesService.getInstance();
                            if (storage.coins > 40) {
                              balance -= 40;
                              storage.coins -= 40;
                              setState(() {
                                final int result =
                                    Fortune.randomInt(0, items.length);
                                print(result);
                                controller.add(result);
                                onSpinEnd(result);
                                Future.delayed(const Duration(seconds: 6), () {
                                  bet = 0;
                                  context.router.push(WinRoute(type: GameType.roulette, winAmount: win));
                                });
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.darkred,
                                  content: Text(
                                    'Not enough Coins... Try later',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                      onTap: () {
                        context.router
                            .popAndPush(MenuRoute(type: GameType.roulette));
                      },
                      child:
                          SvgPicture.asset('assets/images/elements/menu.svg')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
