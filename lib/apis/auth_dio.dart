import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiwee/screens/login/login_screen.dart';

Future<Dio> authDio(BuildContext context) async {
  var dio = Dio();
  dio.options.baseUrl = 'http://10.200.15.133:3000';
  const storage = FlutterSecureStorage();
  dio.interceptors.add(
    InterceptorsWrapper(onRequest: (options, handler) async {
      final accessToken = await storage.read(key: 'access_token');
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      return handler.next(options);
    }, onError: (e, handler) async {
      print('auth dio error: $e');
      if (e.response?.statusCode == 401) {
        await storage.deleteAll();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
      return handler.next(e);
    }),
  );
  return dio;
}
