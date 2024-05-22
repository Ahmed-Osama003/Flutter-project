
import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateLoading()){
    init();
  }

  List<homeModel> homeData = [];
  List<homeModel> cartData = [];
  List<homeModel> favData = [];
  double cartPrice = 0.0;
  DatabaseRepo repo = DatabaseRepo();


  Future<void> init() async {
    emit(HomeStateLoading());
    await repo.initDB();
    //first insertion for tabs
        await repo.insertHomeProduct("All", "lib/images/image1.jpg", "Warm Zipper", "\$300", 54, 0, 100);
        await repo.insertHomeProduct("Category", "lib/images/image2.jpg", "Knitted Woo!", "\$650", 120, 0, 100);
        await repo.insertHomeProduct("Top", "lib/images/image3.jpg", "Zipper Win", "\$50", 542, 0, 100);
        await repo.insertHomeProduct("Recommended", "lib/images/image4.jpg", "Child Win", "\$100", 34, 0, 100);
        // await repo.deleteProduct();
    //second insertions
    homeData = await repo.fetchHome();
    cartData = await repo.fetchCartHome();
    favData = await repo.fetchFavoriteHome();
    cartPrice = await repo.fetchTotalPriceForCart();
    if(homeData.isEmpty){
      emit(HomeStateEmpty());
    }
    else{
      emit(HomeStateLoaded());
    }
  }
  void addItemToFavorite(int value, int id){
    repo.updateFavorite(value, id);
    init();
    emit(HomeStateLoaded());
  }

  Future<void> addItemToCart(int value, int id) async {
    repo.updateCart(value, id);
    init();
    emit(HomeStateLoaded());
  }




}
