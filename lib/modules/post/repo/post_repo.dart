import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

Future<Posts> readJsonFromAssetPost() async {
  const assetKey = 'assets/data/mock/posts.json';
  final json = await rootBundle.loadString(assetKey); // load json from assets
  //Parses the string and returns the resulting Json object.
  final map = await jsonDecode(json);
  final results = Posts.fromJson(map);
  return results;
}
