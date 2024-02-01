import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';
import 'package:lizard_fortune_app/widgets/stroke_title_widget.dart';

@RoutePage()
class SpotsScreen extends StatefulWidget {
  const SpotsScreen({super.key});

  @override
  State<SpotsScreen> createState() => _SpotsScreenState();
}

class _SpotsScreenState extends State<SpotsScreen> {
  final controller = PageController();
  int current = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/spots/bg-spots.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  current == 0
                      ? SizedBox(
                          width: 40,
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: SvgPicture.asset(
                            'assets/images/spots/left-arrow-red.svg',
                          ),
                        ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          current = index;
                        });
                      },
                      controller: controller,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StrokeTitleWidget(
                                strokeColor: AppColors.darkorange,
                                textColor: AppColors.white,
                                text: 'Spot Roulette',
                                fontSize: 32),
                            Image.asset('assets/images/spots/roulette.png', height: 180),
                            SizedBox(height: 20),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StrokeTitleWidget(
                                strokeColor: AppColors.darkorange,
                                textColor: AppColors.white,
                                text: 'Spot Slot',
                                fontSize: 32),
                            Image.asset('assets/images/spots/slot.png', height: 180),
                            SizedBox(height: 20),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StrokeTitleWidget(
                                strokeColor: AppColors.darkorange,
                                textColor: AppColors.white,
                                text: 'Spot Pokies',
                                fontSize: 32),
                            Image.asset('assets/images/spots/pokies.png', height: 180),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  current == 2
                      ? SizedBox(
                          width: 50,
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: SvgPicture.asset(
                            'assets/images/spots/right-arrow-red.svg',
                          ),
                        ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: ActionButtonWidget(
                      strokeSize: 2,
                      color: AppColors.blue,
                      strokeColor: AppColors.darkblue,
                      text: 'Play',
                      width: 160,
                      height: 55,
                      onTap: () {
                        switch (current) {
                          case 0:
                            context.router.push(RouletteRoute());
                          case 1:
                            context.router.push(SlotRoute());
                          case 2:
                            context.router.push(PokiesRoute());
                        }
                      }),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                      onTap: () {
                        context.router.popAndPush(HomeRoute());
                      },
                      child: SvgPicture.asset(
                          'assets/images/elements/arrow-left.svg')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
