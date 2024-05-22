import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/myValidation.dart';
class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Please enter your number. you will receive a OTP to create or set a new password via number",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: TextEditingController(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: myValidation().validateNumber,
                decoration:  InputDecoration(
                  labelText: "Enter Number",
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
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpPage(),
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
            ],
          ),
        ),
      ),
    );
  }
}
