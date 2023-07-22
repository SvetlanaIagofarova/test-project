import 'dart:convert';
import 'dart:io';

import 'package:test_project/domain/api_client/api_client_exception.dart';
import 'package:test_project/domain/configurations/configurations.dart';

class NetworkApiClient {
  final _client = HttpClient();

  Uri _makeUri(String path) {
    final uri = Uri.parse('${Configurations.endPoint}$path');
    return uri;
  }

  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser,
  ) async {
    final url = _makeUri(path);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      final result = parser(json);
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

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
