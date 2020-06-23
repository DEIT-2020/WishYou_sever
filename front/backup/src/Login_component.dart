import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'ChatRoom_component.dart';
import 'ContextList_component.dart';
import 'Login_component.dart';
import 'QandA_component.dart';
import 'Send_component.dart';
import 'State_component.dart';

import 'dart:async';
@Component(
  selector: 'Login',
  templateUrl: 'Login_component.html',
  styleUrls: ['Login_component.css'],
   directives: [
    coreDirectives,
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
class LoginComponent implements OnInit {



  @override
  void ngOnInit() async {
    
  }

}



