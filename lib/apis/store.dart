import 'package:flutter/material.dart';
import 'package:kiwee/apis/auth_dio.dart';

class StoreInfo {
  final String storeUuid;
  final String storeName;
  final String storeAddress;
  final String storeCallNumber;
  final int? regularCount;
  final String category;
  final String photo;
  StoreInfo(
    this.storeUuid,
    this.storeName,
    this.storeAddress,
    this.storeCallNumber,
    this.regularCount,
    this.category,
    this.photo,
  );
  StoreInfo.fromJson(Map<String, dynamic> json)
      : storeUuid = json['store_uuid'],
        storeName = json['store_name'],
        storeAddress = json['store_address'],
        storeCallNumber = json['store_call_number'],
        regularCount = json['regular_count'],
        category = json['category'],
        photo = json['photo'];
  Map<String, dynamic> toJson() => {
        'store_uuid': storeUuid,
        'store_name': storeName,
        'store_address': storeAddress,
        'store_call_number': storeCallNumber,
        'regular_count': regularCount,
        'category': category,
        'photo': photo,
      };
}

class StoreService {
  static Future<List<StoreInfo>> getStoreInfoByCategory(
    BuildContext context,
    String category,
  ) async {
    final dio = await authDio(context);
    try {
      final res = await dio.get(
        '/store/category',
        queryParameters: {'category': category},
      );
      final List<StoreInfo> storeInfo = [];
      for (var i = 0; i < res.data.length; i++) {
        storeInfo.add(StoreInfo.fromJson(res.data[i]));
      }
      return storeInfo;
    } catch (e) {
      debugPrint('getStoreInfo error');
      rethrow;
    }
  }

  static Future<StoreInfo> getStoreInfoById(
    BuildContext context,
    String storeUuid,
  ) async {
    final dio = await authDio(context);
    try {
      final res = await dio.get(
        '/store',
        queryParameters: {'store_uuid': storeUuid},
      );
      return StoreInfo.fromJson(res.data[0]);
    } catch (e) {
      debugPrint('getStoreInfo error');
      rethrow;
    }
  }
}
