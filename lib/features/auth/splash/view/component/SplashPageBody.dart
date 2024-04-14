import 'package:ecommerceapp/core/context_extension.dart';
import 'package:flutter/material.dart';



class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
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
    );
  }
}
