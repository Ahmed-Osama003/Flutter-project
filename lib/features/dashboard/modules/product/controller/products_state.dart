part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsStateLoaded extends ProductsState {}
final class ProductsStateIncrease extends ProductsState {}
final class ProductsStateDecrease  extends ProductsState {}