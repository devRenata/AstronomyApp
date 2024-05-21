import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/domain/usecases/fetch_apod_today.dart';
import 'package:astronomy/app/presentation/state_manager/today_apod_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_values.dart';
import 'today_apod_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchApodToday>()])

void main() {
  late MockFetchApodToday fetchApodToday;
  late TodayApodBloc bloc;

  setUp(() {
    fetchApodToday = MockFetchApodToday();
    bloc = TodayApodBloc(fetchApodToday: fetchApodToday);
  });

  group("Usecase - fetchTodayApod", () {
    test("Must emit LoadingApodState and SuccessApodState", () {
      when(fetchApodToday(any)).thenAnswer((_) async => Right(testApod()));
      bloc.input.add(FetchApodTodayEvent());
      expect(bloc.stream, emitsInOrder([LoadingTodayApodState(), SuccessTodayApodState(apod: testApod())]));
    });

    test("Must emit LoadingApodState and ErrorApodState", () {
      when(fetchApodToday(any)).thenAnswer((_) async => Left(NoConnection()));
      bloc.input.add(FetchApodTodayEvent());
      expect(bloc.stream, emitsInOrder([LoadingTodayApodState(), ErrorTodayApodState(message: NoConnection().messageError)]));
    });
  });
}