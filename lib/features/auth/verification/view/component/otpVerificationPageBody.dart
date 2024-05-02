import 'package:ecommerceapp/core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controller/otp_verification_cubit.dart';
import 'otpVerificationPageElevatedButton.dart';



class otpVerificationPageBody extends StatelessWidget {
  const otpVerificationPageBody({super.key, required this.controller});

  final OtpVerificationCubit controller ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpVerificationCubit>.value(
      value: controller,
      child: BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
        builder: (context, state) {

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "enter OTP",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Please enter the OTP code."
                            " you will receive a OTP to create or set a new password via number",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 50),
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      length: 5,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget: const FlutterLogo(
                        size: 24,
                      ),
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: context.width / 6,
                        fieldWidth: context.width / 6,
                        activeFillColor: Color(0xFFD83022),
                        selectedFillColor: Color(0xFFD83022),
                        inactiveFillColor: Color(0xFFD83022),
                        inactiveColor: Color(0xFFD83022),
                        activeColor: Color(0xFFEF6969),
                        fieldOuterPadding: EdgeInsets.only(right: context.width / 60),
                      ),
                      cursorColor: Colors.white,
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.white,
                      enableActiveFill: true,
                      controller: controller.pinCodeController,
                      keyboardType: TextInputType.text,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                      }, appContext: context,
                    ),
                    const SizedBox(height: 30),
                    otpVerificationPageElevatedButton(controller: controller),
                  ],
                ),

              ),
            ),
          );
        },
      ),
    );
  }
}
