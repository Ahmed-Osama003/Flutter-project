import 'package:ecommerceapp/features/auth/register/view/component/SignUpPageBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/register_cubit.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              final RegisterCubit controller = context.read<RegisterCubit>();
              return SafeArea(
                child: SignUpPageBody(controller: controller),
              );
            },
          ),
        ),
      ),
    );
  }

}

