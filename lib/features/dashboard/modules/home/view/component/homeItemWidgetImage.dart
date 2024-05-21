import 'dart:developer';

import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../../product/view/pages/dashboardProduct.dart';
import '../../controller/home_cubit.dart';
class homeItemWidgetImage extends StatelessWidget {
  const homeItemWidgetImage({super.key, required this.HomeModel, required this.controller});
  final homeModel HomeModel;
  final HomeCubit controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: EdgeInsets.only(right: 15),
      child: Row(
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
                    child: Image.asset(HomeModel.image??"lib/images/image1.jpg", fit: BoxFit.cover, height: 180, width: 180),
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

                      child: HomeModel.favorite == 1 ? Icon(CupertinoIcons.heart_fill, color: Color(0xFFDB3022)):Icon(CupertinoIcons.heart, color: Color(0xFFDB3022)),
                      onTap: (){

                        if(HomeModel.favorite == 1){
                          log(HomeModel.id.toString());
                          controller.addItemToFavorite(HomeModel.id??0, 0);
                        }
                        else{
                          controller.addItemToFavorite(HomeModel.id??0, 1);
                          log(HomeModel.favorite.toString());
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(HomeModel.productTitle??"Warm Zipper",style: Theme.of(context).textTheme.displayLarge),
                SizedBox(height: 10),
                SizedBox(
                  width: 120,
                  child: Text("Designed to keep you cozy in the coldest of weather", maxLines: 7,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelSmall,)
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 22),
                    Text('(' + (HomeModel.review != null ? HomeModel.review.toString() : '120') + ')' ,style:Theme.of(context).textTheme.labelLarge,),
                    SizedBox(width: 10),
                    // Text(HomeModel.price??"\$100",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFFDB3022))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
