import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/action_state/action_state.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';

class LikePostRepo {
  // String url =
  static Future<bool> likePost(String? id) async {
    final String url = '/v1/posts/$id/like';
    String? userToken = await getUserTokenFromLocalStorage();
    String? api = await getAPI();

    debugPrint(url.toString());
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api!, connectTimeout: 6000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${ActionStatus.likePostSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      debugPrint(
        ActionStatus.likePostSuccessful,
      );
      rethrow;
    }
  }

  static Future<bool> unlikePost(String? id) async {
    String? userToken = await getUserTokenFromLocalStorage();
    String? api = await getAPI();

    String url = "/v1/posts/$id/unlike";
    // debugPrint(url.toString());
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
        'Res status: ${res.statusCode.toString()}, ${ActionStatus.unlikePostSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      debugPrint(
        ActionStatus.unlikePostSuccessful,
      );
      rethrow;
    }
  }
}
