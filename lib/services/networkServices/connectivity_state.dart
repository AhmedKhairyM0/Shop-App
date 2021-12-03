import 'package:connectivity/connectivity.dart';

class InternetStatus {
  static InternetStatus? _instance;
  InternetStatus._internal();
  factory InternetStatus()  {
    return _instance ??= InternetStatus._internal();
  }

  Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !(connectivityResult == ConnectivityResult.none);
  }
}
