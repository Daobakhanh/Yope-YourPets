import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

Future<Posts> readJsonFromAssetPost() async {
  const assetKey = 'assets/data/mock/posts.json';
  final json = await rootBundle.loadString(assetKey); // load json from assets
  //Parses the string and returns the resulting Json object.
  final map = await jsonDecode(json);
  final results = Posts.fromJson(map);
  return results;
}

Future<Comments> readJsonFromAssetComment() async {
  const assetKey = 'assets/data/mock/comments.json';
  final json = await rootBundle.loadString(assetKey); // load json from assets
  //Parses the string and returns the resulting Json object.
  final map = await jsonDecode(json);
  final results = Comments.fromJson(map);
  return results;
}

class PostDetailRepo {
  Future<List<Post>?> getPosts() async {
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 6000)).get(
        "/v1/posts",
        queryParameters: {'tags': "portrait"}, //su dung filter feature
        options: Options(method: 'get', headers: {
          "Authorization": "Bearer " + userToken,
          "Content-Type": "application/json"
        }),
      );

      if (res.statusCode != 200) {
        return null;
      }
      // print('Dio: $res');
      List data = res.data['data'];

      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
