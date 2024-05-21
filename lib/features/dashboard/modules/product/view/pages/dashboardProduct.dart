import 'package:ecommerceapp/core/context_extension.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../component/productDetailsPopup.dart';
class dashboardProduct extends StatelessWidget {
  // const dashboardProduct({super.key});

    List<String> imageList = ["lib/images/image1.jpg", "lib/images/image2.jpg", "lib/images/image3.jpg", "lib/images/image4.jpg"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Overview", style: Theme.of(context).textTheme.bodyMedium,),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).badgeTheme.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 450,
                  width: context.width,
                  child: FanCarouselImageSlider(
                    sliderHeight: 430,
                    autoPlay: true,
                    imagesLink: imageList,
                    isAssets: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text("Warm Zipper", style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(height: 5),
                        Text("Hooded Jacket", style:  Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Text("\$300.00",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFFDB3022),
                    )),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Cool, windy weather is on its way. Send him out\n the door in "
                      "a jacket he wants to wear. Warm\n Zooper Hooded Jacket.", style:  Theme.of(context).textTheme.labelLarge),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_cart, color: Color(0xFFDB3022)),
                      ),
                    ),
                    productDetailsPopup(),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
