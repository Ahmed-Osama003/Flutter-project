part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartStateLoading extends CartState {}
final class CartStateLoaded extends CartState {}
final class CartStateEmpty extends CartState {}