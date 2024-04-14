import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/forget_cubit.dart';
import '../component/otpPageBody.dart';



class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: BlocProvider<ForgetCubit>(
          create: (context) => ForgetCubit(),
          child: BlocBuilder<ForgetCubit, ForgetState>(
            builder: (context, state) {
              final ForgetCubit controller = ForgetCubit();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: otpPageBody(controller: controller),
              );
            },
          ),
        ),
      ),
    );
  }
}
