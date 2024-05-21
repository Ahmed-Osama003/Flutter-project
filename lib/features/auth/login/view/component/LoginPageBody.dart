import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/Decoration.dart';
import '../../../../../core/utils/myValidation.dart';
import '../../controller/login_cubit.dart';
import 'LoginPageElevatedButton.dart';




class LoginPageBody extends StatelessWidget {
  LoginPageBody({super.key, required this.controller});

  final LoginCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 110),
        Image.asset("lib/images/freed.png"),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BlocProvider<LoginCubit>.value(
            value: controller,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Form(
                  key:controller.formKey,
                  child: Column(
                    children: [
                      //Name
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+([ -][a-zA-Z]+)*$'))],
                        validator: myValidation().validateName,
                        decoration: DecorationTextField.Decoration().copyWith(),
                      ),
                      SizedBox(height: 15),
                      //Password
                      TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.name,
                        validator: myValidation().validatePassword,
                        decoration: DecorationTextField.Decoration().copyWith(
                          labelText: "Enter Password?",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(onPressed: () {
                            Navigator.pushNamed(context, 'forgetpassword');
                          }, child: const Text(
                              "Forgot Password", style: TextStyle(
                            color: Color(0xFFEF6969),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )))),
                      SizedBox(height: 40),
                      LoginPageElevatedButton(controller: controller),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have an Account? ", style:Theme.of(context).textTheme.labelLarge),
                          TextButton(onPressed: () {
                            Navigator.pushNamed(context, 'signup');
                          }, child: Text("Sign Up", style: TextStyle(
                            color: Color(0xFFEF6969),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

