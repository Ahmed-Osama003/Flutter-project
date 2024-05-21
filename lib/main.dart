import 'package:device_preview/device_preview.dart';
import 'package:ecommerceapp/core/cubit/parent_cubit.dart';
import 'package:ecommerceapp/core/myTheme.dart';
import 'package:ecommerceapp/core/utils/myRoutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/dashboard/view/pages/dashboard.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SharedPreferences sh = await SharedPreferences.getInstance();
  bool firstTime = sh.getBool('onboarding') ?? false;
  // MaterialApp materialApp = MaterialApp(
  //   theme: myTheme.instance.light,
  //   darkTheme: myTheme.instance.dark,
  //   themeMode: ThemeMode.light,
  //   builder: DevicePreview.appBuilder,
  //   useInheritedMediaQuery: true,
  //   // home: dashboard(),
  //   onGenerateRoute: myRoutes.onGenerateRoute,
  //   onGenerateInitialRoutes: (_) => firstTime ? myRoutes.initRoutes2 : myRoutes.initRoutes1,
  // );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) =>
          BlocProvider<ParentCubit>(
            create: (context) => ParentCubit.instance,
            child: BlocBuilder<ParentCubit, ParentState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: myTheme.instance.light,
                  darkTheme: myTheme.instance.dark,
                  themeMode: ParentCubit.instance.themeMode,
                  builder: DevicePreview.appBuilder,
                  useInheritedMediaQuery: true,
                  // home: dashboard(),
                  onGenerateRoute: myRoutes.onGenerateRoute,
                  onGenerateInitialRoutes: (_) =>
                  firstTime
                      ? myRoutes.initRoutes2
                      : myRoutes.initRoutes1,
                );
              },
            ),
          ),
    ),
    // materialApp
  );
}

