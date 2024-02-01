import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/screens/win/win_screen.dart';
import 'package:lizard_fortune_app/services/shared_preferences.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';

@RoutePage()
class SlotScreen extends StatefulWidget {
  const SlotScreen({super.key});

  @override
  State<SlotScreen> createState() => _SlotScreenState();
}

class _SlotScreenState extends State<SlotScreen> {

  @override
  void initState() {
    getBalance();
    super.initState();
  }

  int balance = 0;
  int bet = 0;
  int win = 0;

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

  final List<String> images = [
    'assets/images/games-elements/1.png',
    'assets/images/games-elements/2.png',
    'assets/images/games-elements/3.png',
  ];

  Random _random = Random();
  bool isSpinning = false;
  List<int> selectedImages = [0, 0, 0];

  Future<void> spin() async {
    if (!isSpinning) {
      isSpinning = true;
      for (int i = 0; i < 5; i++) {
        setState(() {
          selectedImages[0] = _random.nextInt(images.length);
          selectedImages[1] = _random.nextInt(images.length);
          selectedImages[2] = _random.nextInt(images.length);
        });
        await Future.delayed(Duration(seconds: 1));
      }
      isSpinning = false;
      checkWin();
    }
  }

  void checkWin() async {

    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    Future.delayed(const Duration(seconds: 1));
    if (selectedImages.toSet().length == 1) {
      final int result = selectedImages[0];

      switch (result) {
        case 0:
          storage.coins += bet * 10;
          win = bet * 10;
        case 1:
          storage.coins += bet * 30;
          win = bet * 30;
        case 2:
          storage.coins += bet * 15;
          win = bet * 15;
      }
      context.router.push(WinRoute(type: GameType.slot, winAmount: win));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/slot/bg-slot.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
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
                            alignment: Alignment(0, -0.57),
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
                    SizedBox(
                      height: 300,
                      width: 345,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 300,
                            width: 345,
                            child: Image.asset('assets/images/slot/slot-machine.png'),
                          ),
                          Align(
                            alignment: Alignment(0, 0.42),
                            child: Container(
                              // color: Colors.white,
                              height: 50,
                              width: 300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Roll(image: images[selectedImages[0]]),
                                  Roll(image: images[selectedImages[1]]),
                                  Roll(image: images[selectedImages[2]]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            if (bet == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.darkred,
                                  content: Text(
                                    'First of all make a bet',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            } else {
                              if (storage.coins > 40) {
                                balance -= 40;
                                storage.coins -= 40;
                                spin();
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
                            .popAndPush(MenuRoute(type: GameType.slot));
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

class Roll extends StatelessWidget {
  final String image;

  Roll({required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: Image.asset(image, height: 55, width: 55));
  }
}