import 'package:ecommerceapp/features/auth/forget/view/pages/ForgetPasswordPage.dart';
import 'package:ecommerceapp/features/auth/forget/view/pages/RecoveryPasswordPage.dart';
import 'package:ecommerceapp/features/auth/login/view/pages/LoginPage.dart';
import 'package:ecommerceapp/features/auth/splash/view/pages/SplashPage.dart';
import 'package:ecommerceapp/features/auth/verification/view/pages/otpVerificationPage.dart';
import 'package:ecommerceapp/features/dashboard/modules/cart/view/pages/dashboardCart.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/view/pages/dashboardHome.dart';
import 'package:ecommerceapp/features/dashboard/modules/product/view/pages/dashboardProduct.dart';
import 'package:flutter/material.dart';
import '../../features/auth/forget/view/pages/OtpPage.dart';
import '../../features/auth/onBoarding/view/pages/onBoarding_Page.dart';
import '../../features/auth/register/view/pages/SignUpPage.dart';
import '../../features/dashboard/view/pages/dashboard.dart';


class myRoutes{
  static List<Route> initRoutes1 = [
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => onBoardingPage()),
  ];
  static List<Route> initRoutes2 = [
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => SplashPage()),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){

      case 'login':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => LoginPage());
      case 'signup':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => SignUpPage());
      case 'forgetpassword':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => ForgetPasswordPage());
      case 'onboarding':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => onBoardingPage());
      case 'splash':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => SplashPage());
      case 'otppage':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => OtpPage());
      case 'otpverify':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => otpVerificationPage());
      case 'recoverypassword':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => RecoveryPasswordPage());
      case 'dashboard':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => dashboard());
      case 'dashboardhome':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => dashboardHome());
      case 'dashboardproduct':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => dashboardProduct());
      case 'dashboardcart':
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => dashboardCart());
      default:
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) => onBoardingPage());
    }
  }
}