import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';
import 'package:yope_yourpet_social_networking/modules/auth/models/auth_login_data_model.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_signin_with_google_utils.dart';
import 'package:yope_yourpet_social_networking/utils/prefs_key.dart';

class LoginWithDofhuntAPI {
  Future<LoginData?> loginWithDofhuntAPIRepo(String? googleAccessToken) async {
    String url = "/v1/auth/gmail";
    String? api = await getAPI();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api!, connectTimeout: 6000)).post(
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

  static Future<bool> loginWithDofhuntAPI() async {
    LoginWithDofhuntAPI loginWithDofhuntRepo = LoginWithDofhuntAPI();

    //get google user token
    String userGoogleAccessToken = await signInWithGoogle();

    // print(object)

    LoginData? loginData = await loginWithDofhuntRepo
        .loginWithDofhuntAPIRepo(userGoogleAccessToken);
    String userToken = loginData!.getAccessToken;
    debugPrint('User token when call dofhunt API: $userToken');

    //handle story user token to local storage
    await saveUserTokenToLocalStorage(userToken);
    await readUserTokenToLocalStorage();
    if (userToken == '') {
      return false;
    }
    return true;
  }

  static Future<void> saveUserTokenToLocalStorage(String userToken) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefsKey.userToken, userToken);
  }

  static Future<String?> readUserTokenToLocalStorage() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String userTokenRead = prefs.getString(PrefsKey.userToken) ?? '';
    // debugPrint(
    //   'Service: Read user token from local str: $userTokenRead',
    // );
    return userTokenRead;
  }
}
