import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get messageError;

  @override
  List<Object> get props => [];
}

class NoConnection extends Failure {
  @override 
  String get messageError => "Sorry! You not have connection.";
}