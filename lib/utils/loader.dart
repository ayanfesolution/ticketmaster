import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:lottie/lottie.dart';
import 'package:ticketmaster/utils/extension/auto_resize.dart';
import 'package:ticketmaster/utils/extension/widget_extention.dart';

class CXSpinner extends StatelessWidget {
  const CXSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150.hh(context),
        child: Lottie.asset(
          'assets/loader.json',
        ).paddingOnly(l: 20.ww(context)),
      ),
    );
  }
}

class CXLoader {
  static void show(BuildContext context) {
    return Loader.show(
      context,
      progressIndicator: const CXSpinner(),
      overlayColor: Colors.black54,
    );
  }

  static void hide() {
    return Loader.hide();
  }
}
