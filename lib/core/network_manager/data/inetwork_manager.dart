import 'package:coffeeapp/core/network_manager/domain/network_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

///Implementation of NetworkManager
class INetworkManager implements NetworkManager {
  ///NetworkManager recive a connection Checker
  INetworkManager(this.connectionChecker);

  /// Access to connectionChecker properties
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected async => true; //connectionChecker.hasConnection;
}
