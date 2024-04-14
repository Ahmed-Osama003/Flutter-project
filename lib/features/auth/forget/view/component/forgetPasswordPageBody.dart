import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/myValidation.dart';
import '../../controller/forget_cubit.dart';
import 'forgetPasswordPageElevatedButton.dart';


class forgetPasswordPageBody extends StatelessWidget {
  forgetPasswordPageBody({super.key, required this.controller});

  final ForgetCubit controller;
  bool clrButton = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>.value(
      value: controller,
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Forget Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Please enter your email address. you will receive a link to create or set a new password via email",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              Form(
                key: controller.formKey,
                child: TextFormField(
                  controller: controller.ForgetPasswordEmailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  validator: myValidation().validateEmail,
                  onChanged: (val) {
                    if (val != "") {
                      clrButton = true;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    suffix: InkWell(
                      onTap: () {
                        if(clrButton){
                          controller.ForgetPasswordEmailController.clear();
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.multiply,
                        color: Color(0xFFDB3022),
                      ),
                    ),
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
              const SizedBox(height: 50),
              forgetPasswordPageElevatedButton(controller: controller),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text("OR"),
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, 'otppage');
                  }, child: Text("Verify using number?", style: TextStyle(
                    color: Color(0xFFEF6969),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ))),
                ],
              ),

            ],
          );
        },
      ),
    );
  }
}
