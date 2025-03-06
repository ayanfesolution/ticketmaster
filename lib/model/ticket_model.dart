import 'package:ticketmaster/model/ticket_response.dart';

class TicketModel {
  final List<Event>? events;
  final int? pageNumber;
  final int? totalPages;

  TicketModel({this.events, this.pageNumber, this.totalPages});

  TicketModel copyWith({
    List<Event>? events,
    int? pageNumber,
    int? totalPages,
  }) {
    return TicketModel(
      events: events ?? this.events,
      pageNumber: pageNumber ?? this.pageNumber,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}