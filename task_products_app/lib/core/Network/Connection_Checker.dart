import 'package:internet_connection_checker/internet_connection_checker.dart';


abstract class  BaseConnectionChecker {

  Future<bool> getConnectionCkecker();
}



class ConnectionChecker extends BaseConnectionChecker {

  final InternetConnectionChecker connectionChecker ;

  ConnectionChecker({required this.connectionChecker});

  @override
  Future<bool> getConnectionCkecker() {
    return connectionChecker.hasConnection;
  }
}