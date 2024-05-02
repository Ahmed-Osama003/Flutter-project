import 'package:ecommerceapp/core/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: (){
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
                          Text("Color: ", style: iStyle),
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
                              SizedBox(width: 10),
                              Text("-", style: iStyle),
                              SizedBox(width: 10),
                              Text("1", style: iStyle),
                              SizedBox(width: 10),
                              Text("+", style: iStyle),
                              SizedBox(width: 30),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(children: [
                    Text("Total Payments", style: iStyle),
                    SizedBox(width: 10),
                    Text("\$300.00",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFDB3022))),

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
  }
}
