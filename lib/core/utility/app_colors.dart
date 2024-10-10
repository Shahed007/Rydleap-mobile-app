import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPrimary = Color.fromARGB(255, 255, 220, 45);
  static const Color darkSecondary = Color.fromARGB(255, 240, 249, 190);
  static const Color darkPrimary = Color.fromARGB(255, 223, 255, 17);
  static const Color lightAccent = Color.fromARGB(255, 137, 211, 240);
  static const Color lightBG = Color(0xfffcfcff);
  static const Color darkBG = Colors.black;
  static const Color primaryPurple = Color(0xFF6334DC);

  static const Color textWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color primaryWhiteSmoke = Color(0xFFF5F5F5);
  static const Color mediumYellow = Color(0xffFDB846);
  static const Color darkYellow = Color(0xffE99E22);
  static const Color bPrimaryColor = Color(0xFFFFC61F);
  static const Color bgPrimaryColor = Color(0xffffd31d);
  static const Color lightGrey = Color(0xFFD0D0D0);
  static const Color nestBlue = Color(0xFF0757AC);
  static const Color white = Color(0xffffffff);
  static const Color navy_blue = Color(0xff001B26);
  static const Color lemon = Color(0xffDEFF11);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');
    final HSLColor hsl = HSLColor.fromColor(color);
    final HSLColor hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  /// Returns a [MaterialColor] from a [Color] object
  static MaterialColor getMaterialColorFromColor(Color color) {
    final Map<int, Color> colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color),
      500: color,
      600: getShade(color, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  static const Color mainColor = Color(0xff141414);
  static const Color textBlack = Color(0xff0D2528);
  static const Color textGrey = Color(0xff8B8484);
  static const Color textYellow = Color(0xffFFDD2D);
  static const Color musicTabBorderDark = Color(0xff666666);
  static const Color checkGreen = Color(0xff00E45B);
  static const Color textGreen = Color(0xff6AD26E);
  static const Color tealAcent = Color(0xff00CCD0);
  static const Color textFieldBorderColor = Color(0xff343434);
  static const Color tabBorderColor = Color(0xff1A1A1A);
  static const Color paymentIconBorderColor = Color(0xff666666);
  static const Color languageBorderColor = Color(0xff3F3F3F);
  static const Color appbarColor = Color(0xff001B26);
  static const Color whiteGrayColor = Color(0xffF0EFEF);
  static const Color redColor = Color(0xffC61515);
  static const Color diveiderColor = Color(0xffF9F9F9);
}
