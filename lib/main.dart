import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/provider/system_setup/theme_data_provider.dart';
import 'package:ticketmaster/utils/injector.dart';
import 'package:ticketmaster/utils/routes.dart';
import 'package:ticketmaster/utils/theme_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('eventCache'); // Open Hive box for caching
  await initializeDependencies();
  await getIt.allReady();
  await dotenv.load();
  runApp(ProviderScope(child: const TicketMasterApp()));
}

class TicketMasterApp extends ConsumerWidget {
  const TicketMasterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    print(themeMode.name);
    return MaterialApp.router(
      title: 'TicketMaster App',
      theme: TicketMasterTheme.lightMode,
      darkTheme: TicketMasterTheme.darkMode,
      themeMode: themeMode,
      routerConfig: router,

      debugShowCheckedModeBanner: false,
    );
  }
}
