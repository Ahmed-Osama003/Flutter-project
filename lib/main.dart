import 'package:flutter/material.dart';
import 'package:ecommerceapp/features/auth/login/pages/LoginPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce Shopping",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEF6969),
      ),
      home: LoginPage(),
    );
  }
}
