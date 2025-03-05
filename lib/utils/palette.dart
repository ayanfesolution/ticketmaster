import 'package:flutter/material.dart';

class Palette {
  final Color primaryColor = const Color(0xFF1A998E);
  final Color pureWhite = const Color(0xFFFFFFFF);
  final Color dividerColor = const Color(0xFFEEEEEE);
  final Color darkModeBackground = const Color(0xFF181A20);
  final Color onboardingDarkMode = const Color(0xFF1F222A);
  final Color textColor = const Color(0xFF212121);
  final Color inactiveTextColor = const Color(0xFF9E9E9E);
  final Color fullBlack = const Color(0xFF181A20);
  final Color transparent = const Color.fromARGB(0, 24, 26, 32);
  final Color buttonSecColorDarkMode = const Color(0xFF1F222A);
  final Color buttonSecColorLightMode = const Color(0xFFF0FBFA);
  final Color inactiveDotLightMode = const Color(0xFFE0E0E0);
  final Color inactiveDotDarkMode = const Color(0xFF757575);
  final Color inactiveTextfieldIconColor =
      const Color.fromRGBO(158, 158, 158, 1);
  final Color strokeDark = const Color(0xFF35383F);
  final Color textFieldColorLightMode = const Color(0xFFFAFAFA);
  final Color textFieldColorDarkMode = const Color(0xFF1F222A);
  final Color containerDarkModeColor = const Color(
    0xFF35383F,
  );
  final Color containerLightModeColor = const Color(0xFFFAFAFA);

  MaterialColor kCustomPryColor = MaterialColor(0xFF1A998E, kMapPRYCOLOR);

  MaterialColor kCustomSECColor = MaterialColor(0xFFFFB366, kMapSECCOLOR);
}

Map<int, Color> kMapSECCOLOR = {
  50: const Color.fromRGBO(255, 179, 102, .1),
  100: const Color.fromRGBO(255, 179, 102, .2),
  200: const Color.fromRGBO(255, 179, 102, .3),
  300: const Color.fromRGBO(255, 179, 102, .4),
  400: const Color.fromRGBO(255, 179, 102, .5),
  500: const Color.fromRGBO(255, 179, 102, .6),
  600: const Color.fromRGBO(255, 179, 102, .7),
  700: const Color.fromRGBO(255, 179, 102, .8),
  800: const Color.fromRGBO(255, 179, 102, .9),
  900: const Color.fromRGBO(255, 179, 102, 1)
};

Map<int, Color> kMapPRYCOLOR = {
  50: const Color.fromRGBO(26, 153, 142, .1),
  100: const Color.fromRGBO(26, 153, 142, .2),
  200: const Color.fromRGBO(26, 153, 142, .3),
  300: const Color.fromRGBO(26, 153, 142, .4),
  400: const Color.fromRGBO(26, 153, 142, .5),
  500: const Color.fromRGBO(26, 153, 142, .6),
  600: const Color.fromRGBO(26, 153, 142, .7),
  700: const Color.fromRGBO(26, 153, 142, .8),
  800: const Color.fromRGBO(26, 153, 142, .9),
  900: const Color.fromRGBO(26, 153, 142, 1)
};
