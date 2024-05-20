import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/view/pages/dashboardHome.dart';
import 'package:flutter/cupertino.dart';
import '../../modules/home/view/pages/dashboardCart.dart';
import '../../modules/home/view/pages/dashboardFavorite.dart';
import '../../modules/home/view/pages/dashboardProfile.dart';

class dashboardBody extends StatefulWidget {
  const dashboardBody({super.key});

  @override
  State<dashboardBody> createState() => _dashboardState();
}

class _dashboardState extends State<dashboardBody> {
  int pageIndex = 0;
  List<Widget> pages = [
    dashboardHome(),
    dashboardCart(),
    dashboardFavorite(),
    // dashboardProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.qr_code, size: 20, ),
          backgroundColor: Color(0xFFDB3022),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.heart,
          CupertinoIcons.cart,
          CupertinoIcons.profile_circled,
        ],
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: Color(0xFFDB3022),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge, // Corrected property name
        leftCornerRadius: 10, // Corrected property name
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 0,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
