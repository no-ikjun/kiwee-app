import 'package:flutter/material.dart';
import 'package:kiwee/apis/auth_dio.dart';

class MenuInfo {
  final String menuUuid;
  final String menuName;
  final String menuPrice;
  final String storeUuid;
  final String subName;
  final String photo;
  MenuInfo(
    this.menuUuid,
    this.menuName,
    this.menuPrice,
    this.subName,
    this.photo,
    this.storeUuid,
  );
  MenuInfo.fromJson(Map<String, dynamic> json)
      : menuUuid = json['menu_uuid'],
        menuName = json['menu_name'],
        menuPrice = json['menu_price'],
        subName = json['sub_name'],
        photo = json['photo'],
        storeUuid = json['store_uuid'];
  Map<String, dynamic> toJson() => {
        'menu_uuid': menuUuid,
        'menu_name': menuName,
        'menu_price': menuPrice,
        'sub_name': subName,
        'photo': photo,
        'store_uuid': storeUuid,
      };
}

class MenuService {
  static Future<MenuInfo> getMenuInfoByUuid(
    BuildContext context,
    String menuUuid,
  ) async {
    final dio = await authDio(context);
    try {
      final res = await dio.get(
        '/menu',
        queryParameters: {'menuid': menuUuid},
      );
      final MenuInfo menuInfo = MenuInfo.fromJson(res.data[0]);
      return menuInfo;
    } catch (e) {
      debugPrint('getMenuInfo error');
      rethrow;
    }
  }

  static Future<List<MenuInfo>> getSavedMenuInfo(
    BuildContext context,
  ) async {
    final dio = await authDio(context);
    try {
      final res = await dio.get(
        '/user/menu',
      );
      final List<MenuInfo> menuInfo = [];
      for (var i = 0; i < res.data.length; i++) {
        final String menuUuid = res.data[i]['menu_uuid'];
        final menu = await getMenuInfoByUuid(context, menuUuid);
        menuInfo.add(menu);
      }
      return menuInfo;
    } catch (e) {
      debugPrint('getSavedMenuInfo error');
      rethrow;
    }
  }
}
