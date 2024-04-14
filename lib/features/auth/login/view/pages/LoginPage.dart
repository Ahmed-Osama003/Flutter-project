import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/login_cubit.dart';
import '../component/LoginPageBody.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final LoginCubit controller = LoginCubit();
              return SafeArea(
                child: LoginPageBody(controller: controller),
              );
            },
          ),
        ),
      ),
    );
  }
}

