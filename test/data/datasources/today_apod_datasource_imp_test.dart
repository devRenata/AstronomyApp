import 'dart:convert';
import 'dart:io';

import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/data/datasources/today_apod_datasource_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../fixtures.dart';
import '../../mocks.mocks.dart';
import '../../test_values.dart';

void main() {
  late MockClient client;
  late TodayApodDataSourceImp dataSource;

  setUp(() {
    client = MockClient();
    dataSource = TodayApodDataSourceImp(client: client);
  });

  group('Function fetchTodayAPod', () {
    test('Must return an Apod Model', () async {
      when(client.get(any)).thenAnswer((_) async => http.Response.bytes(utf8.encode(fixtures("image_response.json")), 200));
      final result = await dataSource.fetchTodayApod();
      expect(result, testApodModel());
    });

    test('Must throw an ApiFailure when the api returns a value other than 200', () async {
      when(client.get(any)).thenAnswer((_) async => http.Response.bytes(utf8.encode(fixtures("image_response.json")), 500));
      expect((_) => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });

    test('Must throw an ApiFailure when there is an exception', () async {
      when(client.get(any)).thenThrow(const SocketException("message"));
      expect((_) => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });
  });
}
