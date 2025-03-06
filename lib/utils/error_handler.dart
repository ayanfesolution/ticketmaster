import 'package:dio/dio.dart';

class NetworkExceptions {
  static String getDioException(dynamic error) {
    if (error is DioException) {
      try {
        switch (error.type) {
          case DioExceptionType.cancel:
            return 'Request cancelled';

          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            return 'Request timed out';

          case DioExceptionType.connectionTimeout:
            return 'Connection timed out!';

          case DioExceptionType.connectionError:
            return 'Error in connecting to the server';

          case DioExceptionType.badCertificate:
            return 'Invalid authorization';

          case DioExceptionType.badResponse:
            //if (error.response?.data != null) {
            // Handle specific error structure from backend
            //   if (error.response!.data['error'] is List) {
            //     return error.response!.data['error'][0];
            //   }
            //   return error.response!.data['message'] ?? 'An error occurred';
            // } else {
            //   return error.response!.data['message'] ??
            //       'Invalid server response';
            // }
            if (error.response?.statusCode == 500) {
              return 'Internal server error';
            } else {
              return error.response?.data['message'] ?? '';
            }

          case DioExceptionType.unknown:
            return 'An unknown error occurred!';
        }
      } on FormatException {
        return 'Bad response format';
      } on DioException catch (dioError) {
        return dioError.response?.data['message'] ?? '';
      } catch (errorData) {
        return "Error connecting to the server";
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return 'Unexpected error occured';
      } else {
        return 'Unexpected error occured';
      }
    }
  }
}
