import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/otp_verification_cubit.dart';
import '../component/otpVerificationPageBody.dart';

class otpVerificationPage extends StatelessWidget {
  const otpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpVerificationCubit>(
      create: (context) => OtpVerificationCubit(),
      child: BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
        builder: (context, state) {
          final OtpVerificationCubit controller = context.read<OtpVerificationCubit>();
          return Scaffold(
            body: otpVerificationPageBody(controller: controller),
          );
        },
      ),
    );
  }
}
