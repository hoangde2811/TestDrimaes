import 'package:connectivity_plus/connectivity_plus.dart';


class CheckInternet {
  bool _checkconnect = false;
  String _ipv4 = "";
  bool get checkconnect => _checkconnect;

  Future<bool> getConnectInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
