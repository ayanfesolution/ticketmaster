import 'package:flutter/cupertino.dart';

class KeyboardUtil {
  KeyboardUtil._sharedInstance();

  static final KeyboardUtil sharedInstance = KeyboardUtil._sharedInstance();

  hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  nextFocus(FocusNode focusNode, BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
