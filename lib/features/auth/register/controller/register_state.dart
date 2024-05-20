part of 'register_cubit.dart';


@immutable
sealed class RegisterState {}

final class RegisterStateLoading extends RegisterState {}
final class RegisterStateLoaded extends RegisterState {}
final class RegisterStateEmpty extends RegisterState {}