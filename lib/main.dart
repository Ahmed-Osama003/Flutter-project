import 'package:ecommerceapp/core/utils/myRoutes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sh = await SharedPreferences.getInstance();
  bool firstTime = sh.getBool('onboarding')??false;
  MaterialApp materialApp = MaterialApp(
    onGenerateRoute: myRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => firstTime ? myRoutes.initRoutes2 : myRoutes.initRoutes1,
  );
  runApp(materialApp);
}

