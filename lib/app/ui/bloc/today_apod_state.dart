part of 'today_apod_bloc.dart';

abstract class TodayApodState extends Equatable {
  const TodayApodState();

  @override 
  List<Object?> get props => [];
}

class SuccessTodayApodState extends TodayApodState {
  final Apod apod;
  const SuccessTodayApodState({required this.apod});

  @override
  List<Object?> get props => [apod];
}

class ErrorTodayApodState extends TodayApodState {
  final String message;
  const ErrorTodayApodState({required this.message});

  @override 
  List<Object?> get props => [message];
}

class LoadingTodayApodState extends TodayApodState {
  
}