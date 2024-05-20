import 'package:ecommerceapp/core/utils/myValidation.dart';
import 'package:ecommerceapp/features/auth/register/view/component/SignUpPageElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/Decoration.dart';
import '../../controller/register_cubit.dart';



class SignUpPageBody extends StatelessWidget {
  SignUpPageBody({super.key, required this.controller});


  final RegisterCubit controller;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>.value(
      value: controller,
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return state is RegisterStateLoading ?Center(child: CircularProgressIndicator()):
          state is RegisterStateEmpty?Center(child:Icon(CupertinoIcons.delete)):
          Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset("lib/images/freed.png"),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      //name
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        validator: myValidation().validateName,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+([ -][a-zA-Z]+)*$'))],
                        decoration: DecorationTextField.Decoration(),
                      ),
                      SizedBox(height: 15),
                      //email
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: myValidation().validateEmail,
                        decoration: DecorationTextField.Decoration().copyWith(
                          labelText: "Enter Email",
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 15),
                      //phoneNumber
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.number,
                        validator: myValidation().validateNumber,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))],
                        decoration: DecorationTextField.Decoration().copyWith(
                          labelText: "Enter Your Phone Number",
                          prefixIcon: const Icon(Icons.numbers),
                        ),
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
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      SizedBox(height: 15),
                      //confirm password
                      TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.confirmPasswordController,
                        keyboardType: TextInputType.name,
                        validator: myValidation().validatePassword,
                        decoration: DecorationTextField.Decoration().copyWith(
                          labelText: "Confirm Enter Password?",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      SizedBox(height: 40),
                      SignUpPageElevatedButton(controller: controller),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have an Account? ", style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          )),
                          TextButton(onPressed: () {

                            Navigator.pushNamed(context, 'login');
                          }, child: Text("Log In", style: TextStyle(
                            color: Color(0xFFEF6969),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
