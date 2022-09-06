import 'package:dio/dio.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

class ProfileListFollowingRepo {
  Future<List<User>?> getListFollowing(String userId) async {
    String? userToken = await getUserTokenFromLocalStorage();
    String url = '/v1/users/$userId/followings';
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).get(
        url,
        options: Options(method: 'get', headers: {
          "Authorization": "Bearer " + userToken!,
          "Content-Type": "application/json"
        }),
      );

      if (res.statusCode != 200) {
        return null;
      }
      // print('Dio: $res');
      List data = res.data['data'];

      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
