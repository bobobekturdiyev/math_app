import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../resources/data_state.dart';
import 'error_response.dart';

abstract class DataException {
  static DataError<T> getError<T>(dynamic exception) {
    if (exception is DioException) {
     if (exception.type == DioExceptionType.badResponse&&exception.response?.statusCode == 401) {
      return DataError<T>(
          ErrorResponse(message: 'something_went_wrong'.tr(), status:401 ));
    }if (exception.type == DioExceptionType.badResponse&&exception.response?.statusCode == 400) {
      return DataError<T>(
          ErrorResponse(message: 'The selected value is invalid'.tr(), status:401 ));
    }
     else if (exception.response != null && exception.response?.data != null) {
        return DataError<T>(ErrorResponse.fromJson(exception.response?.data));
      }

      if (exception.type == DioExceptionType.connectionError) {
        return DataError<T>(
            ErrorResponse(message: 'connection_error'.tr(), status: -400));
      } else if (exception.type == DioExceptionType.connectionTimeout) {
        return DataError<T>(
            ErrorResponse(message: 'connection_timeout'.tr(), status: 0));
      } else if (exception.type == DioExceptionType.badResponse) {
        return DataError<T>(
            ErrorResponse(message: 'something_went_wrong'.tr(), status: 0));
      }
    }
    return DataError<T>(
      ErrorResponse(message: exception.toString(), status: 0),
    );
  }
}
