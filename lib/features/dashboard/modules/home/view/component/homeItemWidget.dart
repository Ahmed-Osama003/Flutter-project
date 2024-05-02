import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:flutter/material.dart';



import '../../controller/home_cubit.dart';
class homeItemWidget extends StatelessWidget {
  const homeItemWidget({super.key, required this.HomeModel, required this.controller});
  final homeModel HomeModel;
  final HomeCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(HomeModel.tabs??'tab'),
        Text(HomeModel.productTitle??'title'),
      ],
    );
  }
}
