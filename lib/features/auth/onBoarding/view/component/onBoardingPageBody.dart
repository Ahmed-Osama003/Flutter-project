import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/on_boarding_controller_cubit.dart';
import 'onBoardingElevatedButton.dart';




class onBoardingPageBody extends StatelessWidget {
  onBoardingPageBody({super.key, required this.controller});


  OnBoardingControllerCubit controller;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome To Our App"),
        Expanded(
          child: BlocProvider<OnBoardingControllerCubit>.value(
            value: controller,
            child: BlocBuilder<OnBoardingControllerCubit,
                OnBoardingControllerState>(
              builder: (context, state) {
                OnBoardingControllerCubit controller =
                context.read<OnBoardingControllerCubit>();
                return PageView(
                  controller: controller.pageController,
                  children:
                  List.generate(controller.data.length, (index) {
                    if(index == controller.data.length - 1){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(controller.data[index].image,
                              width: 200,
                            ),
                            SizedBox(height: 50),
                            Text(controller.data[index].titles,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(controller.data[index].bodyTitles,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                              ),),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 50),
                              child: Container(
                                child: onBoardingElevatedButton(),
                            ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(controller.data[index].image,
                            width: 200,
                          ),
                          SizedBox(height: 50),
                          Text(controller.data[index].titles,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(controller.data[index].bodyTitles,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
