import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../model/onBoardingModel.dart';
part 'on_boarding_controller_state.dart';



class OnBoardingControllerCubit extends Cubit<OnBoardingControllerState> {

  OnBoardingControllerCubit() : super(OnBoardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext(){
    pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.linear);
  }

  void onChangeToBack(){
    pageController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.linear);
  }

  List data = [
    onBoardingModel(image: "lib/images/splash1.png", titles: "Shop Now", bodyTitles: "Our Shop App is your one-stop destination for all your shopping needs. With a wide range of products available at your fingertips, you can browse and purchase your favorite items easily and conveniently."),
    onBoardingModel(image: "lib/images/splash2.png", titles: "Big Discount", bodyTitles:"With our Big Discounts, you can enjoy significant savings on clothing, accessories, electronics, home decor, and much more. We regularly update our discounted items, ensuring that you have access to the latest deals and promotions."),
    onBoardingModel(image: "lib/images/splash3.png", titles: "Free Delivery", bodyTitles:"With Free Delivery, you can enjoy the convenience of having your purchases shipped directly to your doorstep without any additional shipping charges. you won't have to worry about paying for shipping.")
  ];
}
