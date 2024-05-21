import 'package:astronomy/app/data/datasources/network_info.dart';
import 'package:astronomy/app/data/datasources/today_apod_datasource.dart';
import 'package:astronomy/app/domain/entities/apod.dart';
import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/domain/repositories/today_apod_repository.dart';
import 'package:dartz/dartz.dart';

class TodayApodRepositoryImp implements TodayApodRepository {
  final TodayApodDataSource dataSource;
  final NetworkInfo networkInfo;

  TodayApodRepositoryImp({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Apod>> fetchApodToday() async {
    if(!await networkInfo.isConnected) {return Left(NoConnection());}
    try {
      final model = await dataSource.fetchTodayApod();
      return Right(model);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
