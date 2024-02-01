import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/screens/daily_reward/bloc/daily_reward_bloc.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';
import 'package:lizard_fortune_app/widgets/stroke_title_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home/bg-home.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 250,
                      child: StrokeTitleWidget(
                        text: 'LIZARD FORTUNE',
                        fontSize: 48,
                        textColor: AppColors.titlered,
                        strokeColor: AppColors.yellow,
                      ),
                    ),
                    Column(
                      children: [
                        ActionButtonWidget(
                          color: AppColors.red,
                          strokeColor: AppColors.darkred,
                          text: 'Spots',
                          width: 240,
                          height: 55,
                          strokeSize: 2,
                          onTap: () {
                            context.router.push(SpotsRoute());
                          },
                        ),
                        SizedBox(height: 15),
                        ActionButtonWidget(
                          color: AppColors.red,
                          strokeColor: AppColors.darkred,
                          text: 'Exit',
                          width: 240,
                          height: 55,
                          strokeSize: 2,
                          onTap: () {
                            SystemChannels.platform
                                .invokeMethod<void>('SystemNavigator.pop');
                          },
                        ),
                      ],
                    ),
                  ],
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
                        child: SvgPicture.asset(
                            'assets/images/elements/sound.svg'),
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
                alignment: Alignment.centerRight,
                child: BlocProvider(
                  create: (context) =>
                      DailyRewardBloc()..add(CheckDailyRewardEvent()),
                  child: BlocConsumer<DailyRewardBloc, DailyRewardState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is SuccessDailyRewardState) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/daily_reward/envelope.png',
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StrokeTitleWidget(
                                      text: 'Daily Reward'.toUpperCase(),
                                      fontSize: 24,
                                      textColor: AppColors.titlered,
                                      strokeColor: AppColors.yellow,
                                    ),
                                    Text(
                                      'Your daily reward is ready.',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ActionButtonWidget(
                                    color: AppColors.blue,
                                    strokeColor: AppColors.darkblue,
                                    text: 'Open reward',
                                    width: 140,
                                    height: 55,
                                    strokeSize: 4,
                                    onTap: () {
                                      context.router.push(DailyRewardRoute());
                                    },),
                              ],
                            ),
                          ),
                        );
                      } else if (state is FailureDailyRewardState) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/daily_reward/envelope.png',
                                width: 80,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeTitleWidget(
                                      text: 'Daily Reward'.toUpperCase(),
                                      textColor: AppColors.titlered,
                                      strokeColor: AppColors.yellow,
                                      fontSize: 24),
                                  Container(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'You can open daily ',
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'reward in ',
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            CountdownTimer(
                                              textStyle: TextStyle(
                                                color: AppColors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              endTime: DateTime.now()
                                                      .millisecondsSinceEpoch +
                                                  state.timeLeft,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ActionButtonWidget(
                                  color: AppColors.blue,
                                  strokeColor: AppColors.darkblue,
                                  text: 'Open reward',
                                  width: 140,
                                  height: 55,
                                strokeSize: 4,
                                  onTap: () {
                                    context.router.push(DailyRewardRoute());
                                  },),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
