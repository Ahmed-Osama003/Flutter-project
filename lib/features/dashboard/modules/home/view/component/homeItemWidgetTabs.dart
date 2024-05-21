import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:flutter/material.dart';



import '../../controller/home_cubit.dart';
class homeItemWidgetTab extends StatelessWidget {
  const homeItemWidgetTab({super.key, required this.HomeModel, required this.controller});
  final homeModel HomeModel;
  final HomeCubit controller;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 40,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme!.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: FittedBox(
            //tabs[index]
            child: Text(HomeModel.tabs??"Tab", style: Theme.of(context).textTheme.bodyLarge)
          ),
          ),
        ),
      );
  }
}
