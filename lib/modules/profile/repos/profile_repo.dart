import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

Future<Users> readJsonFromAssetUser() async {
  const assetKey = 'assets/data/mock/users.json';
  final json = await rootBundle.loadString(assetKey); // load json from assets
  //Parses the string and returns the resulting Json object.
  final map = await jsonDecode(json);
  final results = Users.fromJson(map);
  return results;
}
