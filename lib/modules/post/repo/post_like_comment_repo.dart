import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/action_state/action_state.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';

class LikeCommentRepo {
  // String url =
  static Future<bool> likeComment(String? postId, String? commentId) async {
    final String url = '/v1/posts/$postId/comments/$commentId/like';
    // debugPrint(url.toString());
    String? userToken = await getUserTokenFromLocalStorage();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${ActionStatus.likeCommentSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      debugPrint(
        ActionStatus.likeCommentFail,
      );
      rethrow;
    }
  }

  static Future<bool> unlikeComment(String? postId, String? commentId) async {
    String? userToken = await getUserTokenFromLocalStorage();

    try {
      final String url = '/v1/posts/$postId/comments/$commentId/unlike';
      debugPrint(url.toString());

      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).post(
        url,
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${ActionStatus.unlikeCommentSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      debugPrint(
        ActionStatus.unlikeCommentFail,
      );
      rethrow;
    }
  }
}
