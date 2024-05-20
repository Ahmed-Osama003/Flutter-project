part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

class ProductsStateLoaded extends ProductsState {
  final int counter;
  final int total;

  ProductsStateLoaded({required this.counter, required this.total});
}
final class ProductsStateIncreasing extends ProductsState {}
final class ProductsStateDecreasing extends ProductsState {}