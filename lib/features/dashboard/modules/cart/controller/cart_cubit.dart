import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../cart/model/repo/database_repo.dart';
import '../model/entity_model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateLoading()){
    // init();
  }



  List<cartModel> homeData = [];
  DatabaseRepo repo = DatabaseRepo();


  Future<void> init() async {
    emit(CartStateLoading());
    await repo.initDB();
    await repo.insertHomeProduct("All", "lib/images/image1.jpg", "Warm Zipper", "\$300", 100, 100);
    await repo.insertHomeProduct("Category", "lib/images/image2.jpg", "Knitted Woo!", "\$650", 100, 100);
    homeData = await repo.fetchCart();
    if(homeData.isEmpty){
      emit(CartStateEmpty());
    }
    else{
      emit(CartStateLoaded());
    }
  }

  void addItemToCart(int id){
    repo.updateCart(1, id);
    emit(CartStateLoaded());
  }

}
