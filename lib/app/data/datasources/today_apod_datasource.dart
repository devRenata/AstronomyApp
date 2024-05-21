import 'package:astronomy/app/data/models/apod_model.dart';

abstract class TodayApodDataSource {
  Future<ApodModel> fetchTodayApod(
    
  );
}