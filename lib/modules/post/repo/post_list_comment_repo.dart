import 'package:dio/dio.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';

class ListUserCommentRepo {
  // late String? postId;
  Future<List<Comment>?> getListUserCommentPost({String? postId}) async {
    final String url = '/v1/posts/$postId/comments';
    String? userToken = await getUserTokenFromLocalStorage();

    try {
      final res =
          await Dio(BaseOptions(baseUrl: api, connectTimeout: 6000)).get(
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
      //handle Json
      //return list comment
      return data.map((jsonItem) => Comment.fromJson(jsonItem)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
