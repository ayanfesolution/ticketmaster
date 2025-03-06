import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/datasource/tickets_datasource.dart';
import 'package:ticketmaster/model/ticket_model.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/utils/injector.dart';

final ticketProvider = StateNotifierProvider<TicketProvider, TicketModel>((
  ref,
) {
  final authDataSource = getIt.get<TicketDataSource>();
  return TicketProvider(TicketModel(), authDataSource);
});

class TicketProvider extends StateNotifier<TicketModel> {
  TicketProvider(super.state, this.ticketRepository);

  final TicketDataSource ticketRepository;

  getTheEventBasedOnPageNumber({int? pageNumber}) async {
    int pageToLoad = pageNumber ?? 1;
    EventModel response = await ticketRepository.getAllTheEventList(pageToLoad);

    if (response.embedded != null) {
      if (state.events == null) {
        state = TicketModel(
          events: response.embedded?.events,
          pageNumber: response.page?.number,
          totalPages: response.page?.totalPages,
        );
      } else {
        (state.events ?? []).addAll((response.embedded?.events ?? []));
        state = state.copyWith(
          pageNumber: response.page?.number,
          totalPages: response.page?.totalPages,
        );
      }
    }
    print(state.events?.length);
  }
}
