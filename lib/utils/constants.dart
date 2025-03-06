import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketmaster/utils/injector.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

final String baseUrl = 'https://app.ticketmaster.com/discovery/v2';

kToastMsgPopUp({
  String msg = 'error',
  bool success = false,
  ToastGravity toastGravity = ToastGravity.TOP,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: toastGravity,
    timeInSecForIosWeb: 3,
    backgroundColor:
        !success
            ? injector.palette.primaryColor
            : injector.palette.buttonSecColorLightMode,
    fontSize: 16,
  );
}
