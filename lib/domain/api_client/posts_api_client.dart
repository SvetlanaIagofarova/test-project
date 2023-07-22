import 'package:test_project/domain/api_client/api_client.dart';
import 'package:test_project/domain/entity/posts.dart';

class PostsApiClient {
  final _networkApi = NetworkApiClient();

  Future<Posts> getPosts() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = Posts.fromJson(jsonMap);
      return response;
    }

    final result = _networkApi.get(
      '/posts/1',
      parser,
    );
    return result;
  }
}
