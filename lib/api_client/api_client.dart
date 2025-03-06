import 'package:dio/dio.dart';
import 'package:ticketmaster/utils/constants.dart';

class ApiClient {
  ApiClient({required this.dio, this.url = ""}) {
    dio.options.baseUrl = url == "" ? baseUrl : url;

    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
  }

  set header(Map<String, dynamic> header) {
    dio.options.headers = header;
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(url, queryParameters: params);

      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.post(url, data: data, queryParameters: params);

      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  final Dio dio;
  late final String url;
}
