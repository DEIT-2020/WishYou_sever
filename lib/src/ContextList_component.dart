import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'ChatRoom_component.dart';
import 'ContextList_component.dart';
import 'Login_component.dart';
import 'QandA_component.dart';
import 'Send_component.dart';
import 'State_component.dart';
import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'ContextList',
  templateUrl: 'ContextList_component.html',
  styleUrls: ['ContextList_component.css'],
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
class ContextListComponent implements OnInit {
    List<int> heroes = [1,2,3,4,5  ];
  @override
  void ngOnInit() async {
   
  }
}
