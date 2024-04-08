import 'package:ecommerceapp/features/auth/forget/pages/OtpPage.dart';
import 'package:ecommerceapp/features/auth/forget/pages/RecoveryPasswordPage.dart';
import 'package:ecommerceapp/features/auth/register/pages/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerceapp/features/auth/login/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/myValidation.dart';
import 'package:flutter/widgets.dart';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool clrButton = false;
  TextEditingController emailController = TextEditingController();
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
              TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: myValidation().validateEmail,
                onChanged: (val){
                  if(val != ""){
                    setState(() {
                      clrButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  suffix: InkWell(
                    onTap: (){
                      setState(() {
                        emailController.clear();
                      });
                    },
                    child: const Icon(
                        CupertinoIcons.multiply,
                        color:Color(0xFFDB3022),
                    ),
                  ),
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
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecoveryPasswordPage(),
                      )
                  );
                },
                child: Text(
                    "Send Code",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text("OR"),
                  TextButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpPage(),
                        )
                    );
                  }, child: Text("Verify using number?", style:TextStyle(
                    color: Color(0xFFEF6969),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ))),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

