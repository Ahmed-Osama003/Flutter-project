part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeStateLoading extends HomeState {}
final class HomeStateLoaded extends HomeState {}
final class HomeStateEmpty extends HomeState {}
