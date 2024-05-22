import 'package:ecommerceapp/features/dashboard/modules/home/view/pages/dashboardHome.dart';
import 'package:ecommerceapp/features/dashboard/modules/product/view/pages/dashboardProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/dashboard_cubit.dart';
import '../../modules/home/view/pages/dashboardCart.dart';
import '../../modules/home/view/pages/dashboardFavorite.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
  create: (context) => DashboardCubit(),
  child: BlocBuilder<DashboardCubit, DashboardState>(
  builder: (context, state) {
    final DashboardCubit controller = context.read<DashboardCubit>();
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onChangeTap,
        children: [
          dashboardHome(),
          dashboardProduct(),
          dashboardCart(),
          dashboardFavorite(),
          // dashboardProfile(),
        ],
      ),
      // floatingActionButton: SafeArea(
      //
      //   child: FloatingActionButton(
      //     onPressed: () {  },
      //     child: Icon(Icons.qr_code, size: 20, ),
      //     backgroundColor: Color(0xFFDB3022),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).bottomAppBarTheme.color,
        unselectedItemColor: Theme.of(context).bottomAppBarTheme.color,
        currentIndex: controller.pageIndex,
        onTap: controller.onChangeTap,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), label: "BestSeller"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Fav"),
          // BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
        ],
      ),
    );
  },
),
);
  }
}
