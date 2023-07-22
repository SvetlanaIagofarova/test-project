import 'package:test_project/domain/api_client/api_client.dart';
import 'package:test_project/domain/entity/photos.dart';

class PhotosApiClient {
  final _networkApi = NetworkApiClient();

  Future<Photos> getPhotos() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = Photos.fromJson(jsonMap);
      return response;
    }

    final result = _networkApi.get(
      '/albums/1/photos',
      parser,
    );
    return result;
  }
}
