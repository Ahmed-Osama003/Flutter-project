import 'package:device_preview/device_preview.dart';
import 'package:ecommerceapp/core/utils/myRoutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/dashboard/view/pages/dashboard.dart';
import 'firebase_options.dart';




void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SharedPreferences sh = await SharedPreferences.getInstance();
  bool firstTime = sh.getBool('onboarding')??false;
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,
    useInheritedMediaQuery: true,

    home: dashboard(),
    // onGenerateRoute: myRoutes.onGenerateRoute,
    // onGenerateInitialRoutes: (_) => firstTime ? myRoutes.initRoutes2 : myRoutes.initRoutes1,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => materialApp,
    ),
    // materialApp
  );
}

