import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kiwee/apis/auth_dio.dart';

class UserInfo {
  final int id;
  final String userUuid;
  final String userId;
  final int isOwner;
  final String userAddress;
  final String userPhoneNumber;
  UserInfo(
    this.id,
    this.userUuid,
    this.userId,
    this.isOwner,
    this.userAddress,
    this.userPhoneNumber,
  );
  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userUuid = json['user_uuid'],
        userId = json['user_id'],
        isOwner = json['is_owner'],
        userAddress = json['user_address'],
        userPhoneNumber = json['user_phone_number'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'user_uuid': userUuid,
        'user_id': userId,
        'is_owner': isOwner,
        'user_address': userAddress,
        'user_phone_number': userPhoneNumber,
      };
}

class UserToken {
  final bool? loginSuccess;
  final String token;
  final String message;
  UserToken(
    this.loginSuccess,
    this.token,
    this.message,
  );
  UserToken.fromJson(Map<String, dynamic> json)
      : loginSuccess = json['login_success'],
        token = json['token'],
        message = json['message'];
  Map<String, dynamic> toJson() => {
        'login_success': loginSuccess,
        'token': token,
        'message': message,
      };
}

class UserService {
  static Future<UserInfo> getUserInfo(
    BuildContext context,
  ) async {
    final dio = await authDio(context);
    try {
      final res = await dio.get('/user');
      if (res.statusCode == 200) {
        return UserInfo.fromJson(res.data);
      } else {
        throw Exception('Failed to load user info');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load user info - error');
    }
  }

  static Future<UserToken> login(
    String id,
    String password,
  ) async {
    final dio = Dio();
    try {
      final res =
          await dio.post('http://10.200.15.133:3000/user/loginProc', data: {
        'user_id': id,
        'user_password': password,
      });
      if (res.statusCode == 200) {
        return UserToken.fromJson(res.data);
      } else {
        throw Exception('Failed to load user info');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load user info');
    }
  }
}
