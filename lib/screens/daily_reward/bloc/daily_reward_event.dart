part of 'daily_reward_bloc.dart';

@immutable
abstract class DailyRewardEvent {}

class GetDailyRewardEvent extends DailyRewardEvent {}

class CheckDailyRewardEvent extends DailyRewardEvent {}
