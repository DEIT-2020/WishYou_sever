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
  selector: 'Send',
  templateUrl: 'Send_component.html',
  styleUrls: ['Send_component.css'],
  directives: [coreDirectives,routerDirectives],
)
class SendComponent implements OnInit {
  @override
  void ngOnInit() async {
   
  }
}
