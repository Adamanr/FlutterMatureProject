import 'package:dio/dio.dart';
import 'app_interceptor.dart';

class DioClient {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.matule.ru/api',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ))..interceptors.add(AppInterceptor());

  static Dio get instance => _dio;
}