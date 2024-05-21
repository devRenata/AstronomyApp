import 'package:astronomy/app/data/datasources/network_info.dart';
import 'package:astronomy/app/data/datasources/today_apod_datasource.dart';
import 'package:astronomy/app/data/datasources/today_apod_datasource_imp.dart';
import 'package:astronomy/app/data/repositories/today_apod_repository_imp.dart';
import 'package:astronomy/app/domain/repositories/today_apod_repository.dart';
import 'package:astronomy/app/domain/usecases/fetch_apod_today.dart';
import 'package:astronomy/app/presentation/state_manager/today_apod_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpContainer() async {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(internetConnection: getIt()));

  apodToday();
}

void apodToday() {
  getIt.registerLazySingleton<TodayApodDataSource>(() => TodayApodDataSourceImp(client: getIt()));
  getIt.registerLazySingleton<TodayApodRepository>(() => TodayApodRepositoryImp(dataSource: getIt(), networkInfo: getIt()));
  getIt.registerLazySingleton<FetchApodToday>(() => FetchApodToday(repository: getIt()));
  getIt.registerFactory(() => TodayApodBloc(fetchApodToday: getIt()));
}