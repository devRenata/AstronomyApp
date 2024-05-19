import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/domain/entities/apod.dart';
import 'package:astronomy/app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:astronomy/app/domain/usecases/core/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchApodToday extends UserCase<Apod, NoParameter> {
  final TodayApodRepository repository;
  FetchApodToday({required this.repository});
  
  @override
  Future<Either<Failure, Apod>> call(NoParameter parameter) async {
    return await repository.fetchApodToday();
  }
}