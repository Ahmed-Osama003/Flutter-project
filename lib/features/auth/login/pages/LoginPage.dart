import 'package:ecommerceapp/core/utils/myValidation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/features/auth/register/pages/SignUpPage.dart';
<<<<<<< HEAD
import 'package:ecommerceapp/features/auth/forget/pages/ForgetPasswordPage.dart';
=======
>>>>>>> 131c7cf2059cc85149fc6f34dd2d3cd9fee7ec03
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 110),
              Image.asset("lib/images/freed.png"),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.name,
                      validator: myValidation().validateName,
                      decoration:decoration.copyWith(),
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
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
<<<<<<< HEAD
                        child: TextButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPasswordPage(),
                              )
                          );
                        }, child: const Text("Forgot Password", style:TextStyle(
=======
                        child: TextButton(onPressed: (){}, child: const Text("Forgot Password", style:TextStyle(
>>>>>>> 131c7cf2059cc85149fc6f34dd2d3cd9fee7ec03
                          color: Color(0xFFEF6969),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )))),
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
                          "Log In",
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
                        Text("Don't Have an Account? ", style:TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        )),
                        TextButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
<<<<<<< HEAD
                                builder: (context) => const SignUpPage(),
=======
                                builder: (context) => SignUpPage(),
>>>>>>> 131c7cf2059cc85149fc6f34dd2d3cd9fee7ec03
                              )
                          );
                        }, child: Text("Sign Up", style:TextStyle(
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
