import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/features/auth/register/model/repo/database_repo.dart';
import 'package:flutter/cupertino.dart';

import '../model/entity_model/registerModel.dart';
part 'register_state.dart';




class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateLoading()){
    init();
  }

  //signup fields controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //form key for all signup process
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedCreateAccount(BuildContext context){
    log(passwordController.text);
    log(confirmPasswordController.text);
    if(passwordController.text != confirmPasswordController.text){
      log('password != password confirmation');
    }
    else if(formKey.currentState!.validate()){
      Navigator.pushNamed(context, 'login');
      insertNewRegister(nameController.text, emailController.text, phoneNumberController.text, passwordController.text);
    }
    else {
      log('invalid input');
    }
  }
  List<registerModel> registerData = [];
  DatabaseRepo repo = DatabaseRepo();


  Future<void> init() async{
    emit(RegisterStateLoading());
    await repo.initDB();
    registerData = await repo.fetchRegister();
    log(registerData.toString());
    if(registerData.isEmpty){
      emit(RegisterStateEmpty());
    }
    else{
      emit(RegisterStateLoaded());
    }
  }

  void insertNewRegister(String name, String email, String phone, String password){
    repo.insertRegisterInfo(name, email, phone, password);
    init();
    emit(RegisterStateLoaded());
  }
  Future<bool> checkExist(String name){
    return repo.checkEmailExists(name);
  }
  //
  // HomeCubit() : super(HomeStateLoading()){
  //   init();
  // }
  //
  // List<homeModel> homeData = [];
  // List<homeModel> cartData = [];
  // List<homeModel> favData = [];
  // double cartPrice = 0.0;
  // DatabaseRepo repo = DatabaseRepo();
  //
  //
  // Future<void> init() async {
  //   emit(HomeStateLoading());
  //   await repo.initDB();
  //   //first insertion for tabs
  //   // await repo.insertHomeProduct("All", "lib/images/image1.jpg", "Warm Zipper", "\$300", 54, 0, 100);
  //   // await repo.insertHomeProduct("Category", "lib/images/image2.jpg", "Knitted Woo!", "\$650", 120, 0, 100);
  //   // await repo.insertHomeProduct("Top", "lib/images/image3.jpg", "Zipper Win", "\$50", 542, 0, 100);
  //   // await repo.insertHomeProduct("Recommended", "lib/images/image4.jpg", "Child Win", "\$100", 34, 0, 100);
  //   // await repo.deleteProduct();
  //   //second insertions
  //   homeData = await repo.fetchHome();
  //   cartData = await repo.fetchCartHome();
  //   favData = await repo.fetchFavoriteHome();
  //   cartPrice = await repo.fetchTotalPriceForCart();
  //   if(homeData.isEmpty){
  //     emit(HomeStateEmpty());
  //   }
  //   else{
  //     emit(HomeStateLoaded());
  //   }
  // }
  // void addItemToFavorite(int value, int id){
  //   repo.updateFavorite(value, id);
  //   init();
  //   emit(HomeStateLoaded());
  // }
  //
  // Future<void> addItemToCart(int value, int id) async {
  //   repo.updateCart(value, id);
  //   init();
  //   emit(HomeStateLoaded());
  // }


}
