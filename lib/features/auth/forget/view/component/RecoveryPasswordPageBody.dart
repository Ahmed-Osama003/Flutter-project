import 'package:ecommerceapp/features/auth/forget/view/component/recoveryPasswordPageElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/Decoration.dart';
import '../../../../../core/utils/myValidation.dart';
import '../../controller/forget_cubit.dart';



class RecoveryPasswordPageBody extends StatelessWidget {
  RecoveryPasswordPageBody({super.key, required this.controller});

  final ForgetCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>.value(
      value: controller,
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Forget Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.RecoveryPasswordNameController,
                  keyboardType: TextInputType.name,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+([ -][a-zA-Z]+)*$'))],
                  validator: myValidation().validateName,
                  decoration: DecorationTextField.Decoration(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.RecoveryPasswordPasswordController,
                  keyboardType: TextInputType.name,
                  validator: myValidation().validatePassword,
                  decoration: DecorationTextField.Decoration().copyWith(
                    labelText: "New Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.RecoveryPasswordConfirmPasswordController,
                  keyboardType: TextInputType.name,
                  validator: myValidation().validatePassword,
                  decoration: DecorationTextField.Decoration().copyWith(
                    labelText: "Confirm New Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(height: 50),
                recoveryPasswordPageElevatedButton(controller: controller),
              ],
            ),
          );
        },
      ),
    );
  }
}
