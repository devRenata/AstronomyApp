import 'package:astronomy/app/data/datasources/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])

void main() {
  late MockInternetConnectionChecker internetConnection;
  late NetworkInfoImp networkInfo;

  setUp(() {
    internetConnection = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImp(internetConnection: internetConnection);
  });

  test('Must return true if there is a connection', () async {
    when(internetConnection.hasConnection).thenAnswer((_) async => true);
    final result = await networkInfo.isConnected;
    expect(result, true);
  });

  test('Must return false if there is no connection', () async {
    when(internetConnection.hasConnection).thenAnswer((_) async => false);
    final result = await networkInfo.isConnected;
    expect(result, false);
  });
}