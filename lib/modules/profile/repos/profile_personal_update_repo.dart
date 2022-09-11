import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/action_state/action_state.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_data_update.dart';

class ProfileUpdateRepo {
  // CreateCommentRepo();

  static Future<bool> submitProfileDataUpdate(
      DataUpdateProfile? dataUserUpdate) async {
    String? userToken = await getUserTokenFromLocalStorage();
    String? api = await getAPI();

    String url = "/v1/profile";
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api!, connectTimeout: 6000)).put(
        url,
        data: {
          "first_name": dataUserUpdate!.firstName,
          "last_name": dataUserUpdate.lastName,
          "profile": {"bio": dataUserUpdate.bio}
          // "tagged_user_ids": ["gH9vf7UHjLCW"]
        },
        options: Options(method: 'put', headers: {
          "Authorization": "Bearer " + userToken!,
          // "Content-Type": "application/json"
        }),
      );
      debugPrint(
        'Res status: ${res.statusCode.toString()}, ${ActionStatus.updatePersonalProfileSuccessfull}',
      );

      return res.statusCode == 200;
    } catch (e) {
      debugPrint(ActionStatus.updatePersonalProfileFail);
      rethrow;
    }
  }
}
