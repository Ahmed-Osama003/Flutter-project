import 'package:ecommerceapp/core/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/view/component/containerButtonModel.dart';
import '../../controller/cart_cubit.dart';

class dashboardCart extends StatelessWidget {
  List<String> imageList = [
    "lib/images/image1.jpg",
    "lib/images/image2.jpg",
    "lib/images/image3.jpg",
    "lib/images/image4.jpg"
  ];
  List<String> productTitles = [
    "Warm Zipper",
    "Knitted Woo!",
    "Zipper Win",
    "Child Win"
  ];
  List<String> prices = ["\$300", "\$650", "\$50", "\$100"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("cart"),
              leading: BackButton(),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
            ),
            body:
            // state is CartStateLoading ?CircularProgressIndicator():
            // state is CartStateEmpty?Icon(CupertinoIcons.delete):
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: imageList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  splashRadius: 20,
                                  activeColor: Color(0xFFDB3022),
                                  value: true,
                                  onChanged: (val) {},
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imageList[index],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productTitles[index],
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
                                      prices[index],
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
                                    Icon(CupertinoIcons.plus,
                                        color: Color(0xFFDB3022)),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Checkbox(
                          splashRadius: 20,
                          activeColor: Color(0xFFDB3022),
                          value: false,
                          onChanged: (val) {},
                        )
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Payment",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$1100",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFDB3022),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: containerButtonModel(
                        itext: 'CheckOut',
                        containerWidth: context.width,
                        bgColor: Color(0xFFDB3022),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
