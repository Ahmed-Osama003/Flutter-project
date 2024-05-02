import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateLoading()){
    // init();
  }

  List<homeModel> homeData = [];
  DatabaseRepo repo = DatabaseRepo();


  Future<void> init() async {
    emit(HomeStateLoading());
    await repo.initDB();
    await repo.insertHomeProduct("All", "lib/images/image1.jpg", "Warm Zipper", "\$300", 54, 0, 100);
    await repo.insertHomeProduct("Category", "lib/images/image2.jpg", "Knitted Woo!", "\$650", 120, 0, 100);
    homeData = await repo.fetchHome();
    if(homeData.isEmpty){
      emit(HomeStateEmpty());
    }
    else{
      emit(HomeStateLoaded());
    }
  }
  void addItemToFavorite(int id, int value){
    repo.updateFavorite(value, id);
    init();
    emit(HomeStateLoaded());
  }

  void addItemToCart(int id){
    repo.updateCart(1, id);
    emit(HomeStateLoaded());
  }



}
