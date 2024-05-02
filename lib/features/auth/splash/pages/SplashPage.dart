import 'dart:async';

import 'package:ecommerceapp/features/auth/login/pages/LoginPage.dart';
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
        ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("lib/images/image2.jpg"),
            fit: BoxFit.cover,
            opacity: 0.4,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart,size: 250,color: Color.fromARGB(255, 238, 80, 80)),
            Text("DP SHOP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,

            )),
          ],
        ),
      ),
    );
  }
}
