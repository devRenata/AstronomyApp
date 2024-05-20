import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/data/data_sources/network_info.dart';
import 'package:astronomy/app/data/data_sources/today_apod_datasouce.dart';
import 'package:astronomy/app/data/repositories/today_apod_repository_imp.dart';
import 'package:astronomy/app/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_values.dart';
import 'today_apod_repository_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodDataSource>(), MockSpec<NetworkInfo>()])
// comando para gerar os mocks: flutter pub run build_runner build

main() {
  late MockTodayApodDataSource dataSource;
  late MockNetworkInfo networkInfo;
  late TodayApodRepositoryImp repository;

  setUp(() {
    dataSource = MockTodayApodDataSource();
    networkInfo = MockNetworkInfo();
    repository = TodayApodRepositoryImp(
      dataSource: dataSource,
      networkInfo: networkInfo,
    );
  });

  group('function fetchTodayApod', () {
    test('Must return an Apod entity on the right side of Either', () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenAnswer((_) async => testApodModel());
      final result = await repository.fetchApodToday();
      expect(result, Right<Failure, Apod>(testApodModel()));
    });

    test('Must return a Failure on the left side of Either from the Datasource', () async { 
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenThrow(ApiFailure());
      final result = await repository.fetchApodToday();
      expect(result, Left<Failure, Apod>(ApiFailure()));
    });

    test('Must return a Failure on the left of type NoConnection', () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      final result = await repository.fetchApodToday();
      verifyNever(dataSource.fetchTodayApod());
      expect(result, Left<Failure, Apod>(NoConnection()));
    });
  });
}
