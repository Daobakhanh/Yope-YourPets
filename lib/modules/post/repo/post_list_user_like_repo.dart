import 'package:dio/dio.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

class ListUserLikePostRepo {
  // late String? postId;
  Future<List<User>?> getListUserLikePost({String? postId}) async {
    final String url = '/v1/posts/$postId/like/users';
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 6000)).get(
        url,
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
      //handle Json
      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
