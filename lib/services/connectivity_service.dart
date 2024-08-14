// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();
//   StreamController<ConnectivityResult> connectionStatusController = StreamController<ConnectivityResult>();

//   ConnectivityService() {
//     _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
//       connectionStatusController.add(result);
//     });
//   }

//   Stream<ConnectivityResult> get connectionStatus => connectionStatusController.stream;

//   void dispose() {
//     connectionStatusController.close();
//   }
// }
