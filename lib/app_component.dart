import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/WishYou_service.dart';
import 'src/ChatRoom_component.dart';
import 'src/ContextList_component.dart';
import 'src/Login_component.dart';
import 'src/QandA_component.dart';
import 'src/Send_component.dart';
import 'src/State_component.dart';

@Component(
  selector: 'my-app',
template: '''
    <ChatRoom>
    </ChatRoom>,
    <ContextList></ContextList>,
<QandA></QandA>,
<Send></Send>,
<State></State>,

  ''',

  directives: [
    routerDirectives,
    ChatRoomcomponent,
    ContextListComponent,
    LoginComponent,
    QandAComponent,
    SendComponent,
    StateComponent
  ],
  providers: [ClassProvider(WishYouService)],
)
class AppComponent {
  final title = '在这里修改网页标题';
}