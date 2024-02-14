import 'package:internet_connection_checker/internet_connection_checker.dart';


import '../utils/toast.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<void> checkInternet();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl({this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker!.hasConnection;

  @override
  Future<void> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
    }
    }

}
