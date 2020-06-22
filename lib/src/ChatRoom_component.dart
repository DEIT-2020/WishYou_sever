import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';
import 'ChatRoom_component.dart';
import 'ContextList_component.dart';
import 'Login_component.dart';
import 'QandA_component.dart';
import 'Send_component.dart';
import 'State_component.dart';

@Component(
  selector: 'ChatRoom',
  templateUrl: 'ChatRoom_component.html',
  styleUrls: ['ChatRoom_component.css'],
    directives: [
    routerDirectives,
    ChatRoomcomponent,
    ContextListComponent,
    LoginComponent,
    QandAComponent,
    SendComponent,
    StateComponent,
    routerDirectives
  ],
)
class ChatRoomcomponent implements OnInit {
  @override
  void ngOnInit() async {
   
  }
}
