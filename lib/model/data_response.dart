class DataResponse<T> {
  final bool status;
  final T? data;
  final String message;

  DataResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DataResponse.success(T? data) {
    return DataResponse(status: true, data: data, message: "");
  }

  factory DataResponse.error(String message) {
    return DataResponse(status: false, data: null, message: message);
  }
}
