import 'package:dio/dio.dart';
import 'package:math_app/core/resources/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/locator.dart';
import '../resources/data_state.dart';
import 'error_response.dart';

abstract class DataException {
  static Future<DataError<T>> getError<T>(dynamic exception) async{
    if (exception is DioException) {
      // Check for DioException and handle accordingly
      if (exception.response != null) {
        return await _handleResponseError<T>(exception.response!);
      }

      // Handle specific DioException types
      return _handleDioException<T>(exception);
    }

    // Return a generic error if the exception isn't a DioException
    return DataError<T>(exception.toString());
  }

  // Helper function to handle DioResponse errors
  static Future<DataError<T>> _handleResponseError<T>(Response response) async {
    final data = response.data;

    if (data is Map<String, dynamic>) {
      final errors = data['errors'];
      if (errors != null) {
        return _formatErrorList<T>(errors);
      }

      final error = data['error'];
      if (error is String) {
        return DataError<T>(error, statusCode: response.statusCode);
      } else if (error is Map<String, dynamic>) {
        return DataError<T>(
          error['message'] ?? "Something went wrong",
          statusCode: response.statusCode,
        );
      }

      // Check if the status code is 401 and apply custom logic
      if (response.statusCode == 401) {
        return await _handleCustom401Error<T>(response);
      }

      return DataError<T>(
        ErrorResponse.fromJson(data).message,
        statusCode: response.statusCode,
      );
    }

    return DataError<T>("Unexpected response format",
        statusCode: response.statusCode);
  }

  // Helper function to handle lists of errors
  static DataError<T> _formatErrorList<T>(List errors) {
    final errorMessage = errors.join("\n");
    return DataError<T>(errorMessage);
  }

  // Helper function to handle specific DioException types
  static DataError<T> _handleDioException<T>(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return DataError<T>("Internetda muammo bo'ldi",
            statusCode: exception.response?.statusCode);
      case DioExceptionType.connectionTimeout:
        return DataError<T>("Ma'lumot qaytishida uzilish sodir bo'ldi",
            statusCode: exception.response?.statusCode);
      case DioExceptionType.badResponse:
        return DataError<T>("Nimadir xato ketdi",
            statusCode: exception.response?.statusCode);
      default:
        return DataError<T>("Unexpected error: ${exception.message}");
    }
  }

  // Custom logic for handling 401 Unauthorized errors
  static Future<DataError<T>> _handleCustom401Error<T>(Response response) async{
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(AppKeys.token);
    locator<Dio>().options.headers['Authorization'] = null;
    // Here's an example custom message:
    return DataError<T>(
      "Unauthorized access. Please log in again.",
      statusCode: response.statusCode,
    );
  }

}
