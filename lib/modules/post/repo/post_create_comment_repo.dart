import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';

class CreateCommentRepo {
  // CreateCommentRepo();

  static Future<bool> submitCommentToServer(
      String? content, String? postId) async {
    String url = "/v1/posts/$postId/comments";
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).post(
        url,
        data: {
          "content": content,
          // "tagged_user_ids": ["gH9vf7UHjLCW"]
        },
        options: Options(method: 'post', headers: {
          "Authorization": "Bearer " + userToken,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint('res status : ${res.statusCode}');
      return res.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }
}
