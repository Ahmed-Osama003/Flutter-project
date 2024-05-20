import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/forget_cubit.dart';
import '../component/forgetPasswordPageBody.dart';



class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>(
      create: (context) => ForgetCubit(),
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          final ForgetCubit controller = ForgetCubit();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: forgetPasswordPageBody(controller: controller),
              ),
            ),
          );
        },
      ),
    );
  }
}

