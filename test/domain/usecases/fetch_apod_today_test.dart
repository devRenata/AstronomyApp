import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/domain/entities/apod.dart';
import 'package:astronomy/app/domain/repositories/today_apod_repository.dart';
import 'package:astronomy/app/domain/usecases/core/usecase.dart';
import 'package:astronomy/app/domain/usecases/fetch_apod_today.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_values.dart';
import 'fetch_apod_today_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodRepository>()])

void main() {
  late MockTodayApodRepository repository;
  late FetchApodToday usecase;

  setUp(() {
    repository = MockTodayApodRepository();
    usecase = FetchApodToday(repository: repository);
  });

  test('Must return an Apod entity on the right side of Either', () async{
    when(repository.fetchApodToday()).thenAnswer((_) async => Right<Failure, Apod>(testApod()));
    final result = await usecase(NoParameter());
    expect(result, Right<Failure, Apod>(testApod()));
  });

  test('Must return a Failure on the left side of Either', () async {
    when(repository.fetchApodToday()).thenAnswer((_) async => Left<Failure, Apod>(testNoConnection()));
    final result = await usecase(NoParameter());
    expect(result, Left<Failure, Apod>(testNoConnection()));
  });
}