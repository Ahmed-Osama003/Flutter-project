import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsStateLoaded()){
    init();
  }

  int counter = 0, total = 300;
  int x = 0;
  void init(){
    counter = 1;
    emit(ProductsStateLoaded());
  }
  void increaseCounter(){
    counter++;
    x = 300 * counter;
    log(counter.toString());
    emit(ProductsStateIncrease());
  }
  void decreaseCounter(){
    if(counter != 1) counter--;
    x = 300 * counter;
    log(counter.toString());
    emit(ProductsStateDecrease());
  }
}
