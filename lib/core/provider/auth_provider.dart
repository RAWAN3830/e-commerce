import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../presentation/registration/login_screen.dart';
import '../../presentation/tabs/home_screen/tabbar_screen/tab_bar.dart';
import '../services/auth_service/firebase_auth.dart';

class AuthProvider with ChangeNotifier{
  bool isLoading = false;
  void setLoading(bool val)
  { isLoading = val; }


  late UserCredential userCredential;

  //-----------------------------------  CREATE - USER --------------------------------------------------

  Future<void> createUser({required String email,required String password,required BuildContext context}) async {
   try {
     setLoading(true);
      userCredential = await AuthService.createUser(email: email, password: password);
      notifyListeners();
      setLoading(false);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    }
   catch (e) {
     if (e.toString().contains('[firebase_auth/invalid-email]')) {
       Fluttertoast.showToast(msg: 'The email address is badly formatted.');
     }
     else if(e.toString().contains('[firebase_auth/weak-password]'))
       Fluttertoast.showToast(msg: 'Password should be at least 6 characters');

     else if(e.toString().contains('[firebase_auth/email-already-in-use]'))
       Fluttertoast.showToast(msg: 'The email address is already in use by another account.');
     rethrow;
   }
   notifyListeners();
  }


//-----------------------------------  SING IN USER --------------------------------------------------

  Future<void> signInUser({required String email, required String password,required BuildContext context}) async {
   try {
     setLoading(true);
      userCredential = await AuthService.loginUser(email: email, password: password);
      notifyListeners();
     setLoading(false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  const TabBarScreen(),), (route) => false); 
    }
   catch(e)
   {
     if(e.toString().contains('[firebase_auth/invalid-credential]')){
       Fluttertoast.showToast(msg: 'The supplied auth credential is incorrect malformed or has expired.');
     }
     else if(e.toString().contains('[firebase_auth/channel-error]')){
       Fluttertoast.showToast(msg: 'Unable to establish connection on channel.');
     }
     rethrow;
   }
    notifyListeners();
  }
}