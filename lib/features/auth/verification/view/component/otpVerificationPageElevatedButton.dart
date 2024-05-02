import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/otp_verification_cubit.dart';

class otpVerificationPageElevatedButton extends StatelessWidget {
  const otpVerificationPageElevatedButton(
      {super.key, required this.controller});

  final OtpVerificationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpVerificationCubit>.value(
      value: controller,
      child: BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              controller.onTapVerify(context);
            },
            child: Text(
                "Verify",
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
