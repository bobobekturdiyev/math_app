import 'package:dio/dio.dart';

import '../resources/data_state.dart';
import 'error_response.dart';

abstract class DataException {
  static DataError<T> getError<T>(dynamic exception) {
    if (exception is DioException) {
      if (exception.response != null && exception.response?.data != null) {
        final errors = exception.response?.data['errors'];
        if (errors != null && errors is List) {
          // Join the errors into a single message string
          final errorMessage = errors.join("\n");
          return DataError<T>(errorMessage);
        }

        final error = exception.response?.data['error'];

        if (error != null && errors is String) {
          return DataError<T>(error);
        }

        if (error != null && error is Map<String, dynamic>) {
          return DataError<T>(error['message'] ?? "Something went wrong");
        }

        return DataError<T>(
            ErrorResponse.fromJson(exception.response?.data).message);
      }

      if (exception.type == DioExceptionType.connectionError) {
        return DataError<T>("Internetda muammo bo'ldi");
      } else if (exception.type == DioExceptionType.connectionTimeout) {
        return DataError<T>("Ma'lumot qaytishida uzilish sodir bo'ldi");
      } else if (exception.type == DioExceptionType.badResponse) {
        return DataError<T>("Nimadir xato ketdi");
      }
    }
    return DataError<T>(
      exception.toString(),
    );
  }
}
