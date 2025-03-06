import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketmaster/utils/injector.dart';

class TicketMasterTheme {
  static final lightMode = ThemeData(
    scaffoldBackgroundColor: injector.palette.pureWhite,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: injector.palette.primaryColor,
    dividerColor: injector.palette.dividerColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: injector.palette.kCustomPryColor,
      brightness: Brightness.light,
      accentColor: injector.palette.primaryColor,
    ),
    highlightColor: injector.palette.transparent,
    hoverColor: injector.palette.transparent,
    focusColor: injector.palette.transparent,
    splashColor: injector.palette.transparent,

    appBarTheme: AppBarTheme(backgroundColor: injector.palette.pureWhite),
    disabledColor: Colors.grey,
    useMaterial3: true,
  );

  static final darkMode = ThemeData(
    scaffoldBackgroundColor: injector.palette.darkModeBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: injector.palette.darkModeBackground,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: injector.palette.primaryColor,
    dividerColor: injector.palette.dividerColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: injector.palette.kCustomPryColor,
      brightness: Brightness.dark,
      accentColor: injector.palette.primaryColor,
    ),
    highlightColor: injector.palette.transparent,
    hoverColor: injector.palette.transparent,
    focusColor: injector.palette.transparent,
    splashColor: injector.palette.transparent,

    disabledColor: Colors.grey,
    useMaterial3: true,
    //  accentColor: Colors.orange,
  );
}
