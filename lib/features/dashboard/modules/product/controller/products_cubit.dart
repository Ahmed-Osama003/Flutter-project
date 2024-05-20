import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsStateLoaded(counter: 1, total: 300));

  int counter = 1;
  int total = 300;

  void increaseCounter() {
    counter++;
    total = 300 * counter;
    log(counter.toString());
    emit(ProductsStateLoaded(counter: counter, total: total));
  }

  void decreaseCounter() {
    if (counter > 1) {
      counter--;
      total = 300 * counter;
      log(counter.toString());
      emit(ProductsStateLoaded(counter: counter, total: total));
    }
  }
}
