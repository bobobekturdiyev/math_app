abstract class DataState<T> {
  final T? data;
  final String? errorMessage;
  final int? statusCode;

  const DataState({
    this.data,
    this.errorMessage,
    this.statusCode,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required T data, int? statusCode})
      : super(data: data, statusCode: statusCode);
}

class DataError<T> extends DataState<T> {
  DataError(String? errorMessage, {int? statusCode})
      : super(errorMessage: errorMessage, statusCode: statusCode);
}
