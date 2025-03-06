import 'package:dio/dio.dart';
import 'package:ticketmaster/api_client/api_client.dart';
import 'package:ticketmaster/datasource/tickets_datasource.dart';
import 'package:ticketmaster/utils/local_storage_structure.dart';
import 'package:ticketmaster/utils/palette.dart';
import 'package:get_it/get_it.dart';

class Injector {
  final Palette palette = Palette();
  final QuickStorage quickStorage = QuickStorage();
}

Injector injector = Injector();


final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt

    //auth
    ..registerLazySingleton<ApiClient>(() => ApiClient(dio: getIt()))
    ..registerLazySingleton<Dio>(Dio.new)
    //auth
    ..registerLazySingleton<TicketDataSource>(
      () => TicketDataSource(getIt(),),
    );
}