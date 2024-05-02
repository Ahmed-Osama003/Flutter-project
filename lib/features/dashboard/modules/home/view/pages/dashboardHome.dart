import 'dart:js_interop';

import 'package:ecommerceapp/core/context_extension.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/view/component/homeItemWidget.dart';
import 'package:ecommerceapp/features/dashboard/modules/product/view/pages/dashboardProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/home_cubit.dart';
class dashboardHome extends StatelessWidget {
  // const dashboardHome({super.key});
  List<String> tabs = ["All", "Category", "Top", "Recommended"];
  List<String> imageList = ["lib/images/image1.jpg", "lib/images/image2.jpg", "lib/images/image3.jpg", "lib/images/image4.jpg"];
  List<String> productTitles= ["Warm Zipper", "Knitted Woo!", "Zipper Win", "Child Win"];
  List <String> prices = ["\$300", "\$650", "\$50", "\$100"];
  List <String> reviews = ["54", "120", "542", "34"];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
  create: (context) => HomeCubit(),
  child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    final HomeCubit controller = context.read<HomeCubit>();
    return Scaffold(
      // body: state is HomeStateLoading ?CircularProgressIndicator():
      // state is HomeStateEmpty?Icon(CupertinoIcons.delete):
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: context.width / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 2, spreadRadius: 1),
                        // ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Color(0xFFDB3022)),
                          border: InputBorder.none,
                          label: Text("find your product", style: TextStyle()),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: context.width / 6,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 2, spreadRadius: 1),
                        // ],
                      ),
                      child: Center(
                        child: Icon(Icons.notifications, color: Color(0xFFDB3022)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF0DD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("lib/images/freed.png"),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      // itemBuilder: (_, int index) => homeItemWidget(HomeModel: controller.homeData[index], controller: controller),
                      itemBuilder:(context, index){
                      return FittedBox(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: FittedBox(
                              //tabs[index]
                              child: Text(tabs[index], style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                          ),
                        ),
                      );
                  }
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 180,
                  child: ListView.builder(
                      itemCount: imageList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
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
                                        child: Image.asset(imageList[index], fit: BoxFit.cover, height: 180, width: 180),
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
                                        child: Center(child: Icon(Icons.favorite, color: Color(0xFFDB3022))),
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
                                    Text(productTitles[index],style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: 120,
                                      child: Text("Designed to keep you cozy in the coldest of weather", maxLines: 7,overflow: TextOverflow.ellipsis)
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber, size: 22),
                                        Text('(' + reviews[index] + ')'),
                                        SizedBox(width: 10),
                                        Text(prices[index],style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFFDB3022))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                  }),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Newest Products", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 30),
                GridView.builder(
                  itemCount: productTitles.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10  ,
                ),itemBuilder:(context, index){
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
                                    child: Image.asset(imageList[index], width: 180, fit: BoxFit.cover, height: 220),
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
                                    child: Center(child: Icon(Icons.favorite, color: Color(0xFFDB3022))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(productTitles[index],style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 22),
                              Text('(' + reviews[index] + ')'),
                              SizedBox(width: 10),
                              Text(prices[index],style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFFDB3022))),
                            ],
                          ),
                        ],
                      ),
                    );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
