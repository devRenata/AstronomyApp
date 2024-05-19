import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';

abstract class TodayApodRepository {
  Future<Either<Failure, Apod>> fetchApodToday();
}