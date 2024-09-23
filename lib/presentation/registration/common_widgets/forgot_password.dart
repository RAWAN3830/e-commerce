import 'package:e_commerce/presentation/registration/common_widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/string.dart';
import 'button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // forgetPassword() async {
  //   await FirebaseAuth.instance
  //       .sendPasswordResetEmail(email: emailController.text);
  // }

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              LoginScree.forgotp,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              LoginScree.enteremailorphone,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const Text(
              LoginScree.email,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            textField(
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  size: 25,
                  color: Colors.grey,
                ),
                controller: emailController,
                hinttext: LoginScree.enteremailorphone),
            SizedBox(
              height: height * 0.03,
            ),
            MyButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Send Code')
          ]),
        ),
      ),
    );
  }
}