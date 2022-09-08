import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/action_state/action_state.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';

class DeleteCommentRepo {
  // String url =
  static Future<bool> deleteComment(String? postId, String? commentId) async {
    final String url = '/v1/posts/$postId/comments/$commentId';
    // debugPrint(url.toString());
    String? userToken = await getUserTokenFromLocalStorage();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).delete(
        url,
        options: Options(method: 'delete', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${ActionStatus.deleteCommentSuccessful}',
      );
      return res.statusCode == 200;
    } catch (e) {
      // debugPrint(e.toString());
      debugPrint(
        ActionStatus.deleteCommentFail,
      );
      rethrow;
    }
  }
}
