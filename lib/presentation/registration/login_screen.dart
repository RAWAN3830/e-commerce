import 'package:e_commerce/core/constant/extension.dart';
import 'package:e_commerce/presentation/registration/common_widgets/button.dart';
import 'package:e_commerce/core/constant/string.dart';
import 'package:e_commerce/presentation/registration/common_widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../infra/provider/api_provider.dart';
import '../../infra/provider/auth_provider.dart';
import '../tabs/tabbar_screen/tab_bar.dart';
import 'common_widgets/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).isLoading;
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final buttonsizebox = height * .02;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        toolbarHeight: height * .09,
        backgroundColor: Colors.lightGreen,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Login Account',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                'Login into account',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .03,
              ),
              const Text(
                'Email or Phone Number',
                style: TextStyle(
                   fontFamily: 'suse',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
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
                LoginScree.password,
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
                height: height * 0.04,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: true,
                          showDragHandle: true,
                          context: context,
                          builder: (context) {
                            return const ForgetPassword();
                          },
                        );
                      },
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Consumer<AuthProvider>(builder: (context, value, child) {
                return value.isLoading == true? const Center(child: CircularProgressIndicator())
                    :MyButton(
                        text: 'Login',
                        onTap: () {
                         value.signInUser(email: emailController.text, password: passwordController.text, context: context);
                          });
              }),
              SizedBox(
                height: buttonsizebox - 0.04,
              ),
              GestureDetector(
                onTap: () {
                  context.pushAndRemoveUntil(context, target:const TabBarScreen());
                },
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Or using anothor Method',
                      style: TextStyle(color: Color(0xffadb5bd), fontSize: 16),
                    ),
                  ),
                ),
              ),

              //New Password Bottom screen
            ],
          ),
        ]),
      ),
    );
  }
}
