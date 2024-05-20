import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedLogin(BuildContext context){
    if(formKey.currentState!.validate()){
      Navigator.pushNamed(context, 'dashboard');
    }
    else {
      log('invalid input');
    }
  }

}
