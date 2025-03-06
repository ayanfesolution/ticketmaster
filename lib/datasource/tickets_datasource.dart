import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ticketmaster/api_client/api_client.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/utils/constants.dart';
import 'package:ticketmaster/utils/error_handler.dart';

class TicketDataSource {
  TicketDataSource(this.client);
  final ApiClient client;

  Future<EventModel> getAllTheEventList(int pageNumber) async {
    try {
      String? apiKey = dotenv.env['API_KEY'];
      final result = await client.get(
        '/events.json',
        params: {'apikey': apiKey, 'page': pageNumber, 'size': 20},
      );

      final output = EventModel.fromJson(result.data);

      return output;
    } catch (e) {
      kToastMsgPopUp(msg: NetworkExceptions.getDioException(e));
      return EventModel();
    }
  }
}
