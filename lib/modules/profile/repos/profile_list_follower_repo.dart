import 'package:dio/dio.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

class ProfileListFollowerRepo {
  Future<List<User>?> getListFollower(String userId) async {
    String? userToken = await getUserTokenFromLocalStorage();
    String? api = await getAPI();

    String url = '/v1/users/$userId/followers';
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api!, connectTimeout: 3000)).get(
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
