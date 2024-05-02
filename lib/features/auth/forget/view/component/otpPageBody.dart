import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/myValidation.dart';
import '../../controller/forget_cubit.dart';
import 'otpPageElevatedButton.dart';


class otpPageBody extends StatelessWidget {
  otpPageBody({super.key, required this.controller});

  final ForgetCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>.value(
      value: controller,
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Please enter your number. you will receive a OTP to create or set a new password via number",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              Form(
                key: controller.formKey,
                child: TextFormField(
                  controller: controller.otpPageEmailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: myValidation().validateNumber,
                  decoration: InputDecoration(
                    labelText: "Enter Number",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              otpPageElevatedButton(controller: controller),
            ],
          );
        },
      ),
    );
  }
}
