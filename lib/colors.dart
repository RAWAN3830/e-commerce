import 'package:flutter/material.dart';

class ColorConstants {
  static Color starterWhite = hexToColor('#DADADA');
  //static Color starterWhite = Colors.black;
  static Color primaryColor = hexToColor('#1ED760');
  static Color cardBackGroundColor = Colors.black;
  static Color inputHintColor = hexToColor('#FFFFFF');

// static Color primaryColor = hexToColor('#1ED760');
// static Color cardBackGroundColor = hexToColor('#0E0E0F');
// static Color inputHintColor = hexToColor('#FFFFFF');

}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
class PalleteDark {
  static const Color primaryColor = Color.fromRGBO(31, 31, 31, 1);
  static const Color secondaryColor = Color.fromRGBO(40, 40, 40, 1);
  static const Color gradiantToColor = Color.fromRGBO(43, 94, 229, 1);
  static const Color gradiantFromColor = Color.fromRGBO(239, 99, 230, 1);
  static const Color activeTextColor = Colors.white;
  static Color? inactiveTextColor = Colors.grey[400];
}

class PalleteLight {
  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Color(0xFFedf6f9);
  static const Color gradiantToColor = Color(0xFFedf6f9);
  static const Color gradiantFromColor = Color(0xfff3f3f3);
  static const Color activeTextColor = Colors.black;
  static Color? inactiveTextColor = Colors.grey[600];
  static const Color iconColor = Color(0xFF007AD9);
}

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: PalleteDark.primaryColor,
      onPrimary: PalleteDark.primaryColor,
      secondary: PalleteDark.secondaryColor,
      onSecondary: PalleteDark.secondaryColor,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white30,
      onBackground: PalleteDark.secondaryColor,
      surface: Colors.black54,
      onSurface: Colors.black12,
    ),
    scaffoldBackgroundColor: PalleteDark.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: PalleteDark.primaryColor,
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: PalleteDark.primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: PalleteDark.activeTextColor,
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          colors: [
            PalleteDark.gradiantFromColor,
            PalleteDark.gradiantToColor,
          ],
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteDark.activeTextColor,
        fontSize: 70,
      ),
      headlineLarge: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteDark.activeTextColor,
        fontSize: 25,
      ),
      bodyLarge: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteDark.activeTextColor,
        fontSize: 18,
      ),
      bodyMedium: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteDark.activeTextColor,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        color: PalleteDark.inactiveTextColor,
        fontSize: 12,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: PalleteLight.primaryColor,
      onPrimary: PalleteLight.primaryColor,
      secondary: PalleteLight.secondaryColor,
      onSecondary: PalleteLight.secondaryColor,
      error: Colors.red,
      onError: Colors.red,
      background: PalleteLight.secondaryColor,
      onBackground: PalleteLight.secondaryColor,
      surface: Color(0xffcbc0d3),
      onSurface: PalleteLight.gradiantToColor,
    ),
    scaffoldBackgroundColor: PalleteLight.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: PalleteLight.primaryColor,
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: PalleteLight.primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: PalleteLight.iconColor,
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          colors: [
            PalleteLight.gradiantFromColor,
            PalleteLight.gradiantToColor,
          ],
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteLight.activeTextColor,
        fontSize: 70,
      ),
      headlineLarge: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteLight.activeTextColor,
        fontSize: 25,
      ),
      bodyLarge: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteLight.activeTextColor,
        fontSize: 18,
      ),
      bodyMedium: const TextStyle(
        fontFamily: "Poppins",
        color: PalleteLight.activeTextColor,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        color: PalleteLight.inactiveTextColor,
        fontSize: 12,
      ),
    ),
  );
}
