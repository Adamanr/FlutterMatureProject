class ApiError {
  final int status;
  final String message;
  final Map<String, dynamic>? data;

  const ApiError({required this.status, required this.message, this.data});

  static ApiError fromJson(Map<String, dynamic> json) => ApiError(
    status: json['status'] as int? ?? 0,
    message: json['message'] as String? ?? 'Unknown error',
    data: json['data'] as Map<String, dynamic>?,
  );
}