import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class onBoardingElevatedButton extends StatelessWidget {
  const onBoardingElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setBool('onboarding', true);
        Navigator.pushNamed(context, 'signup');
      },
      child: Text("Let's Shop", style: TextStyle(
        color: Colors.white,
        fontSize: 18,

      )),
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(55),
          backgroundColor: Color(0xFFEF6969),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
    );
  }
}
