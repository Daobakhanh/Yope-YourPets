import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

Future<Users> readJsonFromUsersStory() async {
  const assetKey = 'assets/data/mock/users.json';
  final json = await rootBundle.loadString(assetKey); // load json from assets
  //Parses the string and returns the resulting Json object.
  final map = await jsonDecode(json);
  final results = Users.fromJson(map);
  return results;
}

class ListPostsRepo {
  Future<List<Post>?> getPosts() async {
    // String userTokenRead = await getUserTokenKeyFromStorage();
    // debugPrint('userToken: $userTokenRead');
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).get(
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
