import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

Future<Users> readJsonFromUserById() async {
  const assetKey = 'assets/data/mock/users.json';
  final json = await rootBundle.loadString(assetKey); // load json from assets
  //Parses the string and returns the resulting Json object.
  final map = await jsonDecode(json);
  final results = Users.fromJson(map);
  return results;
}

class PersonalProfileRepo {
  Future<bool> getStatusUserTokenUsingPersonalProfileAPi() async {
    String? userToken = await getUserTokenFromLocalStorage();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).get(
        "/v1/profile",
        options: Options(method: 'get', headers: {
          "Authorization": "Bearer " + userToken!,
          "Content-Type": "application/json"
        }),
      );
      // debugPrint('$res');
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // rethrow;
    }
    return false;
  }

  Future<User?> getPersonalProfile() async {
    String? userToken = await getUserTokenFromLocalStorage();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).get(
        "/v1/profile",
        options: Options(method: 'get', headers: {
          "Authorization": "Bearer " + userToken!,
          "Content-Type": "application/json"
        }),
      );

      if (res.statusCode != 200) {
        return null;
      }
      // print('Dio: $res');
      dynamic data = res.data['data'];

      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getUserDetailById(String userId) async {
    String? userToken = await getUserTokenFromLocalStorage();

    String url = "/v1/users/$userId";
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).get(
        url,
        options: Options(method: 'get', headers: {
          "Authorization": "Bearer " + userToken!,
          "Content-Type": "application/json"
        }),
      );

      if (res.statusCode != 200) {
        return null;
      }
      // print('Dio: $res');
      dynamic data = res.data['data'];

      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
