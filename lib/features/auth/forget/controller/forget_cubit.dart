import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'forget_state.dart';



class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  //forget password page
  TextEditingController ForgetPasswordEmailController = TextEditingController();

  //Otp Page
  TextEditingController otpPageEmailController = TextEditingController();

  //Recovery Password Page
  TextEditingController RecoveryPasswordNameController = TextEditingController();
  TextEditingController RecoveryPasswordPasswordController = TextEditingController();
  TextEditingController RecoveryPasswordConfirmPasswordController = TextEditingController();

  //key for all forget process
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //forget password page
  void onPressedSendCode(BuildContext context){
    if(formKey.currentState!.validate()){
      Navigator.pushNamed(context, 'recoverypassword');
    }
    else {
      log('invalid input');
    }
  }

  //otp page
  void onPressedVerifyUsingNumber(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'otpverify');
    }
    else {
      log('invalid input');
    }
  }

  //recovery password page
  void onPressedResetPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'recoverypassword');
    }
    else {
      log('invalid input');
    }
  }

}
