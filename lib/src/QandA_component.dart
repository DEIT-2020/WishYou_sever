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
  selector: 'QandA',
  templateUrl: 'QandA_component.html',
  styleUrls: ['QandA_component.css'],
   directives: [
    routerDirectives,
    ChatRoomcomponent,
    ComtextListComponent,
    LoginComponent,
    QandAComponent,
    SendComponent,
    StateComponent,
    routerDirectives
  ],
)
class QandAComponent implements OnInit {

  @override
  void ngOnInit() async {
   
  }
}
