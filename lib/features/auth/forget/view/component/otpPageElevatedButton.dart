import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/forget_cubit.dart';



class otpPageElevatedButton extends StatelessWidget {
  otpPageElevatedButton({super.key, required this.controller});

  final ForgetCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>.value(
      value: controller,
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              controller.onPressedVerifyUsingNumber(context);
            },
            child: Text(
                "Send Code",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(55),
              backgroundColor: Color(0xFFD83022),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
