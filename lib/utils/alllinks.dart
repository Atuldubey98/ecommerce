import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

class Utils {
  // ignore: non_constant_identifier_names
  static String URL = "http://192.168.0.110:5000";
  // ignore: non_constant_identifier_names
  static String GROCERY = "/getgrocery";
  // ignore: non_constant_identifier_names
  static String NOKIA = "/getnokiaphone";
  // ignore: non_constant_identifier_names
  static String SEACHSPRING = "/getsearchspring";
  static String loginme = "/login";
  static String registerme = "/register";
  static String getcartlist = "/getcartlist/";
  static Map<String, String> headers2 = {"Content-Type": "application/json"};

  static SocketIO getSocketIO(Function socketStatus) {
    SocketIO socketIO = SocketIOManager()
        .createSocketIO(URL, '/', socketStatusCallback: socketStatus);
    socketIO.init();
    socketIO.connect();
    return socketIO;
  }
}
