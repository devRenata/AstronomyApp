import 'dart:convert';

import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/data/datasources/today_apod_datasource.dart';
import 'package:astronomy/app/data/models/apod_model.dart';
import 'package:astronomy/app/environment.dart';
import 'package:http/http.dart' as http;

class TodayApodDataSourceImp implements TodayApodDataSource {
  final http.Client client;

  TodayApodDataSourceImp({required this.client});
  
  @override
  Future<ApodModel> fetchTodayApod() async {
    http.Response response;
    try {
      response = await client.get(Uri.parse(Environment.urlBase));
    } catch (e) {
      throw ApiFailure();
    }

    if(response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      return ApodModel.fromJson(json);
    } else {
      throw ApiFailure();
    }
  }
}