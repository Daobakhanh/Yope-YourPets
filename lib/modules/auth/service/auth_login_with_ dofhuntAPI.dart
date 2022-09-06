import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/modules/auth/models/auth_login_data_model.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_login_with_google_utils.dart';

class LoginWithDofhuntAPI {
  // CreateCommentRepo();

  Future<LoginData?> loginWithDofhuntAPIRepo(String? googleAccessToken) async {
    String url = "/v1/auth/gmail";
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 6000)).post(
        url,
        data: {
          "gmail_token": googleAccessToken,
        },
      );
      debugPrint('res status : ${res.statusCode}');
      // return res.statusCode == 200;
      if (res.statusCode != 200) {
        return null;
      }
      // print('Dio: $res');
      dynamic data = res.data['data'];

      return LoginData.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

Future<void> loginWithDofhuntAPi() async {
  LoginWithDofhuntAPI loginWithDofhuntRepo = LoginWithDofhuntAPI();
  String userGoogleAccessToken = await signInWithGoogle();
  LoginData? loginData =
      await loginWithDofhuntRepo.loginWithDofhuntAPIRepo(userGoogleAccessToken);
  String userToken = loginData!.getAccessToken;
  debugPrint('User token when call dofhunt API: $userToken');
  await saveUserTokenToLocalStorage(userToken);
  await readUserTokenToLocalStorage();
}

Future<void> saveUserTokenToLocalStorage(String userToken) async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userToken', userToken);
}

Future<void> readUserTokenToLocalStorage() async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  prefs.getString('userToken');
  debugPrint(
    'Read user token from local str: ${prefs.getString('userToken')}',
  );
}
