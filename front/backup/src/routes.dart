import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'ChatRoom_component.template.dart' as ChatRoom_template;


export 'route_paths.dart';

class Routes {
  static final chatroom = RouteDefinition(
    routePath: RoutePaths.chatroom,
    component: ChatRoom_template.ChatRoomcomponentNgFactory,
  );

 static final all = <RouteDefinition>[
    chatroom,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.chatroom.toUrl(),
    ),
  ];

}