import 'dart:developer';

import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../product/view/pages/dashboardProduct.dart';
import '../../controller/home_cubit.dart';

class cartItemWidgetAll extends StatelessWidget {
  const cartItemWidgetAll(
      {super.key,
      required this.HomeModel,
      required this.controller,
      this.total});
  final homeModel HomeModel;
  final HomeCubit controller;
  final total;
  @override
  Widget build(BuildContext context) {
    return HomeModel.cart == 0
        ? SizedBox(height: 0)
        : Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      splashRadius: 20,
                      activeColor: Color(0xFFDB3022),
                      value: true,
                      onChanged: (val) {
                        controller.addItemToCart(0, HomeModel.id??0);

                      },
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        HomeModel.image ?? "lib/images/image1.jpg",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(HomeModel.productTitle ?? "Warm Zipper",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                                fontSize: 19)),
                        SizedBox(height: 10),
                        Text(
                          "Hooded Jacket",
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          HomeModel.price ?? "\$100",
                          style: TextStyle(
                            color: Color(0xFFDB3022),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.minus,
                          color: Colors.green,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.plus, color: Color(0xFFDB3022)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
