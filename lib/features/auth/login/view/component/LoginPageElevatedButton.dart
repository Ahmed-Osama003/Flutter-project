import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/login_cubit.dart';



class LoginPageElevatedButton extends StatelessWidget {
  const LoginPageElevatedButton({super.key, required this.controller});

  final LoginCubit controller ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>.value(
      value: controller,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              controller.onPressedLogin(context);
            },
            child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(55),
              backgroundColor: Color(0xFFD83022),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
