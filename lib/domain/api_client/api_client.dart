import 'dart:convert';
import 'dart:io';

import 'package:test_project/domain/api_client/api_client_exception.dart';
import 'package:test_project/domain/configurations/configurations.dart';
import 'package:test_project/domain/entity/comments.dart';
import 'package:test_project/domain/entity/photos.dart';

class ApiClient {
  final _client = HttpClient();

  Future<List<Comments>> getComments() async {
    final url =
        Uri.parse(Configurations.endPoint + Configurations.commentsPath);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v) as List<dynamic>);
      final result = json
          .map((dynamic e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList();
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<List<Photos>> getPhotos() async {
    final url =
        Uri.parse(Configurations.endPoint + Configurations.photosPath);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v) as List<dynamic>);
      final result = json
          .map((dynamic e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList();
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }
}
