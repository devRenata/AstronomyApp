import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker internetConnection;
  NetworkInfoImp({required this.internetConnection});

  @override 
  Future<bool> get isConnected async => await internetConnection.hasConnection;
}