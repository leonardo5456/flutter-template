import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:flutter_template/core/network/api_client.dart';
import 'package:flutter_template/core/network/api_exceptions.dart';
import 'package:flutter_template/core/config/app_config.dart';
import 'package:flutter_template/bootstrap.dart' as bootstrap;
import 'package:flutter_template/core/config/flavor.dart';
import 'package:flutter_template/core/config/env.dart';


void main() {
  group('ApiClient', () {
    late ApiClient apiClient;

    setUp(() {
      // Configuración mínima de AppConfig para estos tests
      bootstrap.appConfig = const AppConfig(
        env: Env.local,
        flavor: Flavor.config1,
        baseUrl: 'https://example.com',
        appName: 'Test App',
      );
    });

    test('GET returns decoded JSON when status code is 200', () async {
      final mockHttpClient = MockClient((http.Request request) async {
        expect(request.url.toString(), 'https://example.com/test');
        return http.Response(jsonEncode({'ok': true}), 200);
      });

      apiClient = ApiClient(client: mockHttpClient);

      final result = await apiClient.get('/test');

      expect(result, isA<Map<String, dynamic>>());
      expect(result['ok'], true);
    });

    test('throws ApiException on non-2xx response', () async {
      final mockHttpClient = MockClient((http.Request request) async {
        return http.Response('Unauthorized', 401);
      });

      apiClient = ApiClient(client: mockHttpClient);

      expect(
        () => apiClient.get('/unauthorized'),
        throwsA(isA<ApiException>()),
      );
    });
  });
}
