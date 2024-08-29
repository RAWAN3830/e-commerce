import 'package:e_commerce/presentation/registration/login_screen.dart';
import 'package:e_commerce/presentation/registration/registration_screen.dart';
import 'package:e_commerce/presentation/tabs/cart_screen/cart_screen.dart';
import 'package:e_commerce/presentation/tabs/description_screen/discription_screen.dart';
import 'package:e_commerce/presentation/tabs/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home: LoginScreen()
      //   home: const DiscriptionScreen()
      //   home: const CartScreen()
    );
  }
}

