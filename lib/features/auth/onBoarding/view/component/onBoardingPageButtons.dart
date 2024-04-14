import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/on_boarding_controller_cubit.dart';




class onBoardingPageButtons extends StatelessWidget {
  onBoardingPageButtons({super.key, required this.controller});


  OnBoardingControllerCubit controller;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingControllerCubit>.value(
      value: controller,
      child: BlocBuilder<OnBoardingControllerCubit,
          OnBoardingControllerState>(
        builder: (context, state) {
          OnBoardingControllerCubit controller =
          context.read<OnBoardingControllerCubit>();
          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: controller.onChangeToBack, child: Text("Back")),
                TextButton(onPressed: controller.onChangeToNext, child: Text("Next")),
              ],
            ),
          );
        },
      ),
    );
  }
}
