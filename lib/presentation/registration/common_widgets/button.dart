import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: const Color(0xff588157),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: colors.buttonTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class LoginViaAnothor extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String ImagePath;
  const LoginViaAnothor(
      {super.key,
      required this.onTap,
      required this.text,
      required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height * 0.07,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 15,
                  child: SvgPicture.asset(ImagePath)),
              SizedBox(
                width: width * 0.04,
              ),
               Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
