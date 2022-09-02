import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

class LikePostRepo {
  // String url =
  static Future<bool> like(String? id) async {
    final String url = '/v1/posts/$id/like';
    debugPrint(url.toString());
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(res.statusCode.toString());
      return res.statusCode == 200;
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<bool> unlike(String? id) async {
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).post(
        "/v1/posts/$id/unlike",
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken,
          // "Content-Type": "application/json"
        }),
      );
      return res.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }
}
