/// Interface for Network Manager
abstract class NetworkManager {
  /// Future that returns true if there is internet connection
  Future<bool> get isConnected;
}
