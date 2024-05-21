import 'dart:developer';

import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../../product/view/pages/dashboardProduct.dart';
import '../../controller/home_cubit.dart';
class homeItemWidgetNewestProducts extends StatelessWidget {
  const homeItemWidgetNewestProducts({super.key, required this.HomeModel, required this.controller});
  final homeModel HomeModel;
  final HomeCubit controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: 180,
            child: Stack(
              children: [
                InkWell(
                  onTap: (){
                    // Navigator.pushNamed(context, 'dashboardproduct');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => dashboardProduct()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(HomeModel.image??"lib/images/image1.jpg", width: 180, fit: BoxFit.cover, height: 220),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // child: Center(child: Icon(Icons.favorite, color: Color(0xFFDB3022))),
                    child: InkWell(

                      child: HomeModel.cart == 1 ? Icon(CupertinoIcons.cart_fill, color: Color(0xFFDB3022)):Icon(CupertinoIcons.cart, color: Color(0xFFDB3022)),
                      onTap: (){
                        log(HomeModel.cart.toString());
                        if(HomeModel.cart == 1){
                          log(HomeModel.id.toString());
                          controller.addItemToCart(0, HomeModel.id??0);
                        }
                        else{
                          controller.addItemToCart(1, HomeModel.id??0);
                        }

                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(HomeModel.productTitle??"Warm Zipper",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 22),
              Text('(' + (HomeModel.review != null ? HomeModel.review.toString() : '120') + ')', style: Theme.of(context).textTheme.labelLarge,),
              SizedBox(width: 10),
              Text(HomeModel.price??"\$100",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFFDB3022))),
            ],
          ),
        ],
      ),
    );
  }
}
