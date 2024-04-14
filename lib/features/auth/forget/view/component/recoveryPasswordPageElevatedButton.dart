import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/forget_cubit.dart';



class recoveryPasswordPageElevatedButton extends StatelessWidget {
  recoveryPasswordPageElevatedButton({super.key, required this.controller});

  final ForgetCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>.value(
      value: controller,
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              controller.onPressedResetPassword(context);
            },
            child: Text(
                "Reset Password",
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
