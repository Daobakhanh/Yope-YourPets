import 'package:dio/dio.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

class ListPostsByUserIdRepo {
  Future<List<Post>?> getPosts(String userId) async {
    String url = '/v1/users/$userId/posts';
    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 3000)).get(
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

      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
