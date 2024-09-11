import 'package:e_commerce/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  final Icon prefixIcon;
  final TextEditingController controller;
  final String hinttext;
  const textField({super.key, required this.prefixIcon, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Color(0xfff8f9fa),
        focusColor:  Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
      ),
    );
  }
}
