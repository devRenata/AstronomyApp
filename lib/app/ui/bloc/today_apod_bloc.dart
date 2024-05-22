import 'dart:async';

import 'package:astronomy/app/domain/entities/apod.dart';
import 'package:astronomy/app/domain/usecases/core/usecase.dart';
import 'package:astronomy/app/domain/usecases/fetch_apod_today.dart';
import 'package:equatable/equatable.dart';

part 'today_apod_event.dart';
part 'today_apod_state.dart';

class TodayApodBloc {
  FetchApodToday fetchApodToday;
  TodayApodBloc({required this.fetchApodToday}) {
    _inputController.stream.listen(_blocEventController);
  }

  final StreamController<TodayApodEvent> _inputController = StreamController<TodayApodEvent>();
  final StreamController<TodayApodState> _outputController = StreamController<TodayApodState>();

  Sink<TodayApodEvent> get input => _inputController.sink;
  Stream<TodayApodState> get stream => _outputController.stream;

  void _blocEventController(TodayApodEvent event) {
    _outputController.add(LoadingTodayApodState());

    if (event is FetchApodTodayEvent) {
      fetchApodToday(NoParameter()).then((value) => value.fold(
        (left) => _outputController.add(ErrorTodayApodState(message: left.messageError)),
        (rigth) => _outputController.add(SuccessTodayApodState(apod: rigth))
      ));
    }
  }
}
