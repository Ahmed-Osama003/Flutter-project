import 'package:ecommerceapp/core/context_extension.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/view/component/homeItemWidgetNewestProducts.dart';
import 'package:ecommerceapp/features/dashboard/modules/product/view/pages/dashboardProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/home_cubit.dart';
import '../component/homeItemWidgetImage.dart';
import '../component/homeItemWidgetTabs.dart';
class dashboardHome extends StatelessWidget {
  // const dashboardHome({super.key});
  List<String> tabs = ["All", "Category", "Top", "Recommended"];
  List<String> imageList = ["lib/images/image1.jpg", "lib/images/image2.jpg", "lib/images/image3.jpg", "lib/images/image4.jpg"];
  List<String> productTitles= ["Warm Zipper", "Knitted Woo!", "Zipper Win", "Child Win"];
  List <String> prices = ["\$300", "\$650", "\$50", "\$100"];
  List <String> reviews = ["54", "120", "542", "34"];
  int length1 = 4;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
  create: (context) => HomeCubit(),
  child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    final HomeCubit controller = context.read<HomeCubit>();
    return Scaffold(
      body: state is HomeStateLoading ?CircularProgressIndicator():
      state is HomeStateEmpty?Icon(CupertinoIcons.delete):
      SingleChildScrollView(
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
                      itemCount: length1,
                      itemBuilder: (_, int index) => homeItemWidgetTab(HomeModel: controller.homeData[index], controller: controller),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: length1,
                      shrinkWrap: true,
                      itemBuilder: (_, int index) => homeItemWidgetImage(HomeModel: controller.homeData[index], controller: controller),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Buy Products", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 30),
                GridView.builder(
                  itemCount: length1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10  ,
                ),itemBuilder: (_, int index) => homeItemWidgetNewestProducts(HomeModel: controller.homeData[index], controller: controller),
                ),
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
