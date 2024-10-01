import 'package:e_commerce/infra/provider/payment_provider.dart';
import 'package:e_commerce/presentation/registration/registration_screen.dart';
import 'package:e_commerce/presentation/tabs/tabbar_screen/tab_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'infra/provider/api_provider.dart';
import 'infra/provider/auth_provider.dart';
import 'infra/provider/cart_provider.dart';
import 'infra/provider/category_api_provider.dart';

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
         ChangeNotifierProvider(create: (context) => CategoryProvider()),
         ChangeNotifierProvider(create: (context) => PaymentProvider()),
      ],
      child: Consumer<ApiProvider>(
        builder: (context,theme,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
             theme: (theme.isTheme == false)
                  ? ThemeData(
                fontFamily: 'suse',
               appBarTheme: const AppBarTheme(actionsIconTheme: IconThemeData(color: Colors.black)),
                useMaterial3: true,
              )
                  : ThemeData.dark(useMaterial3: true),
              home: Consumer<AuthProvider>(
                  builder: (context,value,child) {
                    return value.isLogin() ? const TabBarScreen() : const Registration();
                  }
              )

          );
        }
      ),
    );
  }
}

