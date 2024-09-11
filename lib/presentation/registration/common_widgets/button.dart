import 'package:e_commerce/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key,required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: const Color(0xff588157),
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Center(
          child: Text(
            text,
            style: TextStyle(color:colors.buttonTextColor,fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
