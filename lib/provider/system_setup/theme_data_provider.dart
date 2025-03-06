import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/utils/injector.dart';
import 'package:ticketmaster/utils/local_keys.dart';

final getTheThemeData = StateNotifierProvider<GetTheThemeData, ThemeMode>(
  (ref) => GetTheThemeData(ThemeMode.system),
);

class GetTheThemeData extends StateNotifier<ThemeMode> {
  GetTheThemeData(super.state);

  getTheCurrentSystemTheme(BuildContext context) async {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    String theLastThemeMode = await injector.quickStorage.returnString(
      key: ObjectKeys.themeDate,
    );

    if (theLastThemeMode == 'light') {
      state = ThemeMode.light;
    } else if (theLastThemeMode == 'dark') {
      state = ThemeMode.dark;
    } else {
      if (brightness == Brightness.dark) {
        state = ThemeMode.dark;
      } else {
        state = ThemeMode.light;
      }
    }
  }
}
