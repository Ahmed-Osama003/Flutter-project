import 'package:ecommerceapp/features/auth/onBoarding/view/component/onBoardingPageBody.dart';
import 'package:ecommerceapp/features/auth/onBoarding/view/component/onBoardingPageButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/on_boarding_controller_cubit.dart';




class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  BlocProvider<OnBoardingControllerCubit>(
        create: (context) => OnBoardingControllerCubit(),
        child: BlocBuilder<OnBoardingControllerCubit,
            OnBoardingControllerState>(
          builder: (context, state) {
            OnBoardingControllerCubit controller =
            context.read<OnBoardingControllerCubit>();
            return Scaffold(
              body: onBoardingPageBody(controller: controller),
              bottomNavigationBar: onBoardingPageButtons(controller: controller),
            );
          },
        ),
      ),
    );
  }
}
