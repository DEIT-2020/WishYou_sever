import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

export 'route_paths.dart';

class Routes {
  static final chatroom = RouteDefinition(
    routePath: RoutePaths.chatroom,
  );

  static final all = <RouteDefinition>[
    chatroom,
  ];
}