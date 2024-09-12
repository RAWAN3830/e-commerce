import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/presentation/registration/login_screen.dart';
import 'package:e_commerce/presentation/registration/registration_screen.dart';
import 'package:e_commerce/presentation/tabs/home_screen/home_screen.dart';
import 'package:e_commerce/presentation/tabs/home_screen/tabbar_screen/tab_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/provider/api_provider.dart';
import 'core/provider/auth_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: Consumer<ApiProvider>(
        builder: (context,theme,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',

             theme: (theme.isTheme == false)
                  ? ThemeData(
                colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              )
                  : ThemeData.dark(useMaterial3: true),
             home: const  LoginScreen()

          );
        }
      ),
    );
  }
}

