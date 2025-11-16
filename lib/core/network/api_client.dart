import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import '../../bootstrap.dart';
import 'api_exceptions.dart';

class ApiClient {
  final http.Client _httpClient;

  ApiClient({http.Client? client}) : _httpClient = client ?? http.Client();

  Uri _buildUri(String path, [Map<String, dynamic>? query]) {
    final base = appConfig.baseUrl;
    return Uri.parse('$base$path').replace(queryParameters: query);
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, query);
    final response = await _httpClient.get(uri, headers: headers);
    return _handleResponse(response);
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final uri = _buildUri(path, query);
    final mergedHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };
    final response = await _httpClient.post(
      uri,
      headers: mergedHeaders,
      body: body == null ? null : jsonEncode(body),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final code = response.statusCode;
    if (code >= 200 && code < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    } else {
      throw ApiException(
        'Error calling API',
        statusCode: code,
      );
    }
  }
}
