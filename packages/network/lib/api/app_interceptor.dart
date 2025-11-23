import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message ?? 'Ошибка сети'),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
    }
    super.onError(err, handler);
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();