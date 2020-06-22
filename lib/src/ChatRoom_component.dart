import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'ChatRoom',
  
  templateUrl: 'ChatRoom_component.html',
  styleUrls: ['ChatRoom_component.css'],
  directives: [coreDirectives,  routerDirectives],
)
class ChatRoomcomponent implements OnInit {
  @override
  void ngOnInit() async {
   
  }
}
