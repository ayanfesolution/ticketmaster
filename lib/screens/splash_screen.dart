import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/provider/system_setup/theme_data_provider.dart';
import 'package:ticketmaster/provider/ticket/ticket_provider.dart';
import 'package:ticketmaster/screens/home_page.dart';
import 'package:ticketmaster/utils/app_images.dart';
import 'package:ticketmaster/utils/constants.dart';
import 'package:ticketmaster/utils/extension/auto_resize.dart';
import 'package:ticketmaster/utils/injector.dart';
import 'package:ticketmaster/utils/local_keys.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    initialAction();
    ref.read(ticketProvider.notifier).getTheEventBasedOnPageNumber();
    super.initState();
  }

  Future<Timer> initialAction() async {
    return Timer(const Duration(seconds: 3), () async {
      bool isItAFirstTimeLaunch = await injector.quickStorage.returnBool(
        key: ObjectKeys.firstTimeLaunch,
      );

      String getLastRoute = await injector.quickStorage.returnLastRoute(
        key: ObjectKeys.path,
      );
      if (kDebugMode) {
        print(getLastRoute);
      }

      if (mounted) {
        if (isItAFirstTimeLaunch == false) {
          context.go(HomePage.fullPath);
        } else {
          if (kDebugMode) {
            print('its here');
          }
          context.go(getLastRoute);
        }
      }

      if (kDebugMode) {
        print('Done');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150.hh(context),
                  width: 150.ww(context),
                  child: Image.asset(AppImages.mainImage),
                ),
                Text(
                  'Ticket Master',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80.hh(context)),
              child: CircularProgressIndicator.adaptive(
                // valueColor: ,
                backgroundColor:
                    (themeMode == ThemeMode.dark)
                        ? injector.palette.pureWhite
                        : injector.palette.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
