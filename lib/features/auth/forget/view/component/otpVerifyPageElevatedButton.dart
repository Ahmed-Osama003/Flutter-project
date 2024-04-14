import 'package:flutter/material.dart';



class otpVerifyPageElevatedButton extends StatelessWidget {
  const otpVerifyPageElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, 'recoverypassword');
      },
      child: Text(
          "Verify",
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
    );
  }
}
