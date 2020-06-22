import 'package:angular_router/angular_router.dart';

const userID="id";

class RoutePaths {
  static final login = RoutePath(path: 'login');
  static final chatroom = RoutePath(path: 'chatroom/:$userID');
}
int getId(Map<String, String> parameters) {
  final id = parameters[userID];
  return id == null ? null : int.tryParse(id);
}