import 'package:flutter/material.dart';


class DecorationTextField{
  static InputDecoration Decoration(){
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
    return decoration;
  }

}