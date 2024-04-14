import 'dart:async';
import 'package:ecommerceapp/features/auth/splash/view/component/SplashPageBody.dart';
import 'package:flutter/material.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, 'login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SplashPageBody(),
    );
  }
}
