import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';

class LikeCommentRepo {
  // String url =
  static Future<bool> likeComment(String? postId, String? commentId) async {
    final String url = '/v1/posts/$postId/comments/$commentId/like';
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
      debugPrint('Res status: ${res.statusCode.toString()}');
      return res.statusCode == 200;
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<bool> unlikeComment(String? postId, String? commentId) async {
    try {
      final String url = '/v1/posts/$postId/comments/$commentId/unlike';
      debugPrint(url.toString());

      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint('Res status: ${res.statusCode}');
      return res.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }
}
