import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'ChatRoom_component.dart';
import 'ContextList_component.dart';
import 'Login_component.dart';
import 'QandA_component.dart';
import 'Send_component.dart';
import 'State_component.dart';
@Component(
  selector: 'Login',
  templateUrl: 'Login_component.html',
  styleUrls: ['Login_component.css'],
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
class LoginComponent implements OnInit {

 Router _router;
 

  @override
  void ngOnInit() async {
    
  }
  int userID;
      Future<NavigationResult> gotoChatRoom() =>
      // _router.navigateByUrl("http://127.0.0.1:8080/chatroom");
      _router.navigate("/chatroom");
}



