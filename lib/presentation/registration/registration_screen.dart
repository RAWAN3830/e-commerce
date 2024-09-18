import 'package:e_commerce/core/constant/string.dart';
import 'package:e_commerce/core/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'common_widgets/button.dart';
import 'common_widgets/textfield.dart';
import 'login_screen.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final ButtonSizebox = height * .02;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .09,
        backgroundColor: Colors.lightGreen,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(CreatAccountString.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                CreatAccountString.subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .01,
              ),
              const Text(
                CreatAccountString.user,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              textField(
                  prefixIcon: const Icon(
                    CupertinoIcons.person,
                    size: 25,
                    color: Colors.grey,
                  ),
                  controller: nameController,
                  hinttext: 'Enter your Username'),
              SizedBox(
                height: height * .03,
              ),
              const Text(
                CreatAccountString.email,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                height: height * .03,
              ),
              const Text(
                CreatAccountString.password,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              textField(
                  prefixIcon: const Icon(
                    CupertinoIcons.lock,
                    size: 25,
                    color: Colors.grey,
                  ),
                  controller: passwordController,
                  hinttext: 'Enter Your password'),
              SizedBox(
                height: height * .04,
              ),
              Consumer<AuthProvider>(
                builder: (context, value, child) {
                  return
                    value.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      :
                  MyButton(
                          onTap: () async {
                            await AuthProvider().createUser(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context);
                            // Registration(emailController.text,passwordController.text);
                          },
                          text: 'create account',
                        );
                },
              ),
              SizedBox(
                height: ButtonSizebox - 0.04,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      CreatAccountString.othermethod,
                      style: TextStyle(color: Color(0xffadb5bd), fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ButtonSizebox,
              ),
              GestureDetector(
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
                            child: SvgPicture.asset('assets/google.svg')),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        const Text(
                          'Sign Up with Google',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ButtonSizebox,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          child: SvgPicture.asset('assets/facebook.svg')),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Text(
                        'Sign Up with Facebook',
                        style: TextStyle(fontFamily: "poppins", fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // emailVarification() {
  //   String email = emailController.text;
  //
  //   final bool emailValid = RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(email);
  // }
}
