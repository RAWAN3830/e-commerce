import 'package:e_commerce/presentation/registration/common_widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  forgetPassword()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
  }
  TextEditingController emailController=TextEditingController();
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),


                const Text(
                  'Enter your mail or phone number',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                const Text(
                 'Enter your Email',
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
                    hinttext: 'Enter Your email or Phone number'),
                SizedBox(
                  height: height * 0.03,
                ),
               MyButton(onTap: (){
                 forgetPassword();
                 Navigator.pop(context);
               }, text:'Send Code')
          ]),
        ),
      ),
    );
  }
}
