import 'package:ecommerceapp/core/context_extension.dart';
import 'package:ecommerceapp/features/dashboard/modules/product/controller/products_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'containerButtonModel.dart';
class productDetailsPopup extends StatelessWidget {

  final iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
  create: (context) => ProductsCubit(),
  child: BlocBuilder<ProductsCubit, ProductsState>(
  builder: (context, state) {
    final ProductsCubit controller = context.read<ProductsCubit>();
    // return state is ProductsStateLoaded ?Center(child: CircularProgressIndicator()):InkWell(
      return InkWell(onTap: (){
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: context.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size: ", style: iStyle),
                          SizedBox(height: 20),
                          Text("AColors: ", style: iStyle),
                          SizedBox(height: 20),
                          Text("Total: ", style: iStyle),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text("S", style: iStyle),
                              SizedBox(width: 30),
                              Text("M", style: iStyle),
                              SizedBox(width: 30),
                              Text("L", style: iStyle),
                              SizedBox(width: 30),
                              Text("XL", style: iStyle),
                              SizedBox(width: 30),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Row(
                              children: [
                                for(var i = 0; i < 4; i++)
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      color: colors[i],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.decreaseCounter();
                                },
                                iconSize: 25,
                                icon: Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 0),
                              Text(
                                controller.counter.toString(),
                                style: TextStyle(color: Colors.black)
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  controller.increaseCounter();
                                },
                                iconSize: 25,
                                icon: Icon(
                                  CupertinoIcons.plus,
                                  color: Color(0xFFDB3022),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(children: [
                    Text("Total Payments", style: iStyle),
                    SizedBox(width: 10),
                    Text('${controller.total}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFDB3022))),

                  ]),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 'dashboardcart');
                    },
                    child: containerButtonModel(
                      containerWidth: context.width,
                      itext: "Checkout",
                      bgColor: Color(0xFFDB3022),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: containerButtonModel(
        containerWidth: context.width / 1.5,
        itext: 'Buy Now',
        bgColor: Color(0xFFDB3022),
      ),
    );
  },
),
);
  }
}
