import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/datasource/tickets_datasource.dart';
import 'package:ticketmaster/model/ticket_model.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/utils/constants.dart';
import 'package:ticketmaster/utils/injector.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final ticketProvider = StateNotifierProvider<TicketProvider, TicketModel>((
  ref,
) {
  final authDataSource = getIt.get<TicketDataSource>();
  return TicketProvider(TicketModel(), authDataSource);
});

class TicketProvider extends StateNotifier<TicketModel> {
  TicketProvider(super.state, this.ticketRepository);

  final TicketDataSource ticketRepository;

  final Box _cacheBox = Hive.box('eventCache');

  getTheEventBasedOnPageNumber({int? pageNumber}) async {
    int pageToLoad = pageNumber ?? 1;
    final connectivityResult = await Connectivity().checkConnectivity();
    bool isOffline = connectivityResult.contains(ConnectivityResult.none);

    if (isOffline) {
      TicketModel cachedEvents = loadCachedEvent();
      state = cachedEvents;
      kToastMsgPopUp(msg: 'You are offline, you are viewing cached data');
    } else {
      EventModel response = await ticketRepository.getAllTheEventList(
        pageToLoad,
      );

      if (response.embedded != null) {
        if (state.events == null) {
          state = TicketModel(
            events: response.embedded?.events,
            pageNumber: response.page?.number,
            totalPages: response.page?.totalPages,
          );
          cacheEvents(state.toJson());
        } else {
          (state.events ?? []).addAll((response.embedded?.events ?? []));
          state = state.copyWith(
            pageNumber: response.page?.number,
            totalPages: response.page?.totalPages,
          );
          cacheEvents(state.toJson());
        }
      }
    }

  }

  void cacheEvents(Map<String, dynamic> events) {
    _cacheBox.put('events', jsonEncode(events));
  }

  TicketModel loadCachedEvent() {
    String? cachedData = _cacheBox.get('events');
    if (cachedData != null) {
      Map<String, dynamic> dataValue = jsonDecode(cachedData);
      return TicketModel.fromJson(dataValue);
    } else {
      return TicketModel();
    }
  }
}
