import 'package:ecommerceapp/core/cubit/parent_cubit.dart';
import 'package:flutter/material.dart';



extension MyContextExtension on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension theme on BuildContext{
  ThemeData get getTheme => Theme.of(this);
}
extension myLocalization on String{
  String get tr => ParentCubit.instance.local[this]??this.toUpperCase();
}