import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'otp_verification_state.dart';



class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(OtpVerificationInitial());
  TextEditingController pinCodeController = TextEditingController();

  String textValidator = "22222";
  void onTapVerify(BuildContext context) {
    if (pinCodeController.text != textValidator) {
      Navigator.pushNamed(context, 'recoverypassword');
    }
    else {
      log('invalid input');
    }
  }
}
