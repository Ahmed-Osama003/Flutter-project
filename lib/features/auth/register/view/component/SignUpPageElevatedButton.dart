import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/register_cubit.dart';



class SignUpPageElevatedButton extends StatelessWidget {
  const SignUpPageElevatedButton({super.key, required this.controller});


  final RegisterCubit controller;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>.value(
      value: controller,
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              controller.onPressedCreateAccount(context);
            },
            child: Text(
                "Create Account",
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
