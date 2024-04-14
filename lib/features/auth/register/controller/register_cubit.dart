import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';




class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  //signup fields controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //form key for all signup process
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedCreateAccount(BuildContext context){
    if(formKey.currentState!.validate()){
      Navigator.pushNamed(context, 'login');
    }
    else {
      log('invalid input');
    }
  }


}
