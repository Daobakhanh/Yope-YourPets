import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/action_state/action_state.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';

class FollowUserRepo {
  static Future<bool> followUser(String? userId) async {
    final String url = '/v1/users/$userId/follow';
    String? userToken = await getUserTokenFromLocalStorage();
    String? api = await getAPI();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api!, connectTimeout: 3000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${CallAPIActionStatus.followUserSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      debugPrint(
        'Res status: ${CallAPIActionStatus.followUserFail}',
      );
      rethrow;
    }
  }

  static Future<bool> unFollowUser(String? userId) async {
    String? userToken = await getUserTokenFromLocalStorage();
    String? api = await getAPI();

    try {
      final String url = '/v1/users/$userId/unfollow';

      debugPrint(url.toString());

      final res =
          await Dio(BaseOptions(baseUrl: api!, connectTimeout: 3000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${CallAPIActionStatus.unfollowUserSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      debugPrint(
        'Res status:, ${CallAPIActionStatus.unfollowUserFail}',
      );
      rethrow;
    }
  }
}
