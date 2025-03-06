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

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      events: (json['events'] as List?)?.map((e) => Event.fromJson(e)).toList(),
      pageNumber: json['pageNumber'],
      totalPages: json['totalPages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'events': events?.map((e) => e.toJson()).toList(),
      'pageNumber': pageNumber,
      'totalPages': totalPages,
    };
  }
}