import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/myValidation.dart';
class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                validator: myValidation().validateResetCode,
                decoration: decoration,
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                validator: myValidation().validatePassword,
                decoration: decoration.copyWith(
                  labelText: "New Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                validator: myValidation().validatePassword,
                decoration: decoration.copyWith(
                  labelText: "Confirm New Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: (){
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const RecoveryPasswordPage(),
                  //     )
                  // );
                },
                child: Text(
                    "Reset Password",
                    style:TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
InputDecoration decoration = InputDecoration(
  labelText: "Reset Code",
  prefixIcon: Icon(Icons.numbers),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black,width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  errorBorder:  OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red,width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey,width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
);