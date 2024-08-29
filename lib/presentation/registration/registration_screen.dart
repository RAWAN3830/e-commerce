
// // registration() async {
// //   try {
// //     UserCredential? user =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //         email: emailController.text, password: passwordController.text);
// //
// //     await FirebaseFirestore.instance.collection('Rawan').doc().set({
// //       'name':nameController.text,
// //       'email':user.user!.email,
// //       'uid':user.user!.uid,
// //       'password': passwordController.text});
// //
// //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => new_Screen(),));
// //   } catch (e) {
// //     if (e.toString().contains('[firebase_auth/invalid-email]')) {
// //       Fluttertoast.showToast(msg: 'The email address is badly formatted.');
// //     }
// //     else if(e.toString().contains('[firebase_auth/weak-password]'))
// //       Fluttertoast.showToast(msg: 'Password should be at least 6 characters');
// //
// //     else if(e.toString().contains('[firebase_auth/email-already-in-use]'))
// //       Fluttertoast.showToast(msg: 'The email address is already in use by another account.');
// //     rethrow;
// //   }
// // }
// //
// // loginWithGoogle() async {
// //   try{
// //     GoogleSignIn google = GoogleSignIn();
// //     var user = await google.signIn();
// //
// //     final GoogleSignInAuthentication? googleAuth = await user?.authentication;
// //     final credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth?.accessToken,
// //       idToken: googleAuth?.idToken,
// //     );
// //
// //     await FirebaseAuth.instance.signInWithCredential(credential);
// //     print(user!.displayName);
// //     print(user!.email);
// //     print(user!.photoUrl);
// //
// //     await FirebaseFirestore.instance.collection('Users').doc().set({
// //       'uid': user.id,
// //       'email':user.email,
// //       'name':user.displayName,
// //       'password':'123456',
// //     });
// //
// //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => new_Screen()));
// //   }
// //   catch(e){
// //     rethrow;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('start learning with create your account',style: TextStyle(fontSize: 14,color: Colors.grey.shade700),)
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
              SizedBox(height: height * .01,),
              Text('Username',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person,size: 25,color: Colors.grey,),
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
                  hintText: 'Enter your Username',
                  hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                ),
              ),


              SizedBox(height: height * .03,),
              Text('Email or Phone Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,size: 25,color: Colors.grey,),
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
                  hintText: 'Enter Your email or Phone number',
                  hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                ),
              ),


              SizedBox(height: height * .03,),
              Text('Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.lock,size: 25,color: Colors.grey,),
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
                  hintText: 'Enter Your password',
                  hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                ),
              ),

              SizedBox(height: height * .04,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xff588157),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Center(
                    child: Text(
                      'Create Account',
                      style: const TextStyle(
                          color: Colors.white,fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                ),
              ),


              SizedBox(height: ButtonSizebox - 0.04,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Center(
                    child: Text(
                      'Or using anothor Method',
                      style: const TextStyle(
                          color: Color(0xffadb5bd), fontSize: 18),
                    ),
                  ),
                ),
              ),

              SizedBox(height: ButtonSizebox,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 15,
                            child: SvgPicture.asset('assets/google.svg')),
                        SizedBox(width: width * 0.04,),
                        Text(
                          'Sign Up with Google',
                          style: const TextStyle(
                             fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: ButtonSizebox,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26,width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          child: SvgPicture.asset('assets/facebook.svg')),
                      SizedBox(width: width * 0.04,),
                      Text(
                        'Sign Up with Facebook',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
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
}
