part of 'on_boarding_controller_cubit.dart';


@immutable
sealed class OnBoardingControllerState {}

final class OnBoardingControllerInitial extends OnBoardingControllerState {}
final class OnBoardingPageChange extends OnBoardingControllerState {}

