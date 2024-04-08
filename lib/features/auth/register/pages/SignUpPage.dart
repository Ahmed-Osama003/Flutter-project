
import 'package:ecommerceapp/core/utils/myValidation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/features/auth/login/pages/LoginPage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
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
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.name,
                      validator:myValidation().validateName,
                      decoration: decoration,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                      validator: myValidation().validateEmail,
                      decoration:decoration.copyWith(
                        labelText: "Enter Email",
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      validator: myValidation().validateNumber,
                      decoration:decoration.copyWith(
                        labelText: "Enter Your Number",
                        prefixIcon: const Icon(Icons.numbers),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.name,
                      validator: myValidation().validatePassword,
                      decoration:decoration.copyWith(
                        labelText: "Enter Password?",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.name,
                      validator: myValidation().validatePassword,
                      decoration:decoration.copyWith(
                        labelText: "Confirm Enter Password?",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    SizedBox(height:40),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            )
                        );
                      },
                      child: Text(
                          "Create Account",
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
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have an Account? ", style:TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        )),
                        TextButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              )
                          );
                        }, child: Text("Log In", style:TextStyle(
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
        ),
      ),
    );

  }

}

InputDecoration decoration = InputDecoration(
  labelText: "Enter Name",
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black,width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  errorBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red,width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey,width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
  prefixIcon: Icon(Icons.person),
);
