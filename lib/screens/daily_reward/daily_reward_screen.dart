import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lizard_fortune_app/router/router.dart';
import 'package:lizard_fortune_app/screens/daily_reward/bloc/daily_reward_bloc.dart';
import 'package:lizard_fortune_app/theme/colors.dart';
import 'package:lizard_fortune_app/widgets/action_button_widget.dart';
import 'package:lizard_fortune_app/widgets/stroke_title_widget.dart';

@RoutePage()
class DailyRewardScreen extends StatefulWidget {
  const DailyRewardScreen({super.key});

  @override
  State<DailyRewardScreen> createState() => _DailyRewardScreenState();
}

class _DailyRewardScreenState extends State<DailyRewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/daily_reward/bg-reward.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            children: [
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
              BlocProvider(
                create: (context) =>
                    DailyRewardBloc()..add(CheckDailyRewardEvent()),
                child: BlocConsumer<DailyRewardBloc, DailyRewardState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SuccessDailyRewardState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Image.asset(
                              'assets/images/daily_reward/envelope.png'),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              width: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeTitleWidget(
                                    strokeColor: AppColors.yellow,
                                    textColor: AppColors.titlered,
                                    text: 'Daily ReWard'.toUpperCase(),
                                    fontSize: 46,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Every ',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            '24 hours ',
                                            style: TextStyle(
                                                color: AppColors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'you',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'can get your daily reward.',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                  ),
                                  ActionButtonWidget(
                                    color: AppColors.blue,
                                    strokeColor: AppColors.darkblue,
                                    text: 'OPEN',
                                    width: 140,
                                    height: 55,
                                    onTap: () {
                                      context
                                          .read<DailyRewardBloc>()
                                          .add(GetDailyRewardEvent());
                                      setState(() {});
                                    },
                                    strokeSize: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (state is FailureDailyRewardState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Image.asset(
                              'assets/images/daily_reward/envelope.png'),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              width: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeTitleWidget(
                                      strokeColor: AppColors.yellow,
                                      textColor: AppColors.titlered,
                                      text: 'Daily ReWard'.toUpperCase(),
                                      fontSize: 46),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'We give you ',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            '200 coins',
                                            style: TextStyle(
                                                color: AppColors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'for daily login to the application. We are waiting for you.',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You can open daily',
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
                                      ),
                                      SizedBox(height: 10),
                                      ActionButtonWidget(
                                        color: AppColors.grey,
                                        strokeColor: AppColors.darkgrey,
                                        strokeSize: 4,
                                        text: 'OPEN',
                                        width: 140,
                                        height: 55,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
