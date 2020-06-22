import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';
import 'Login_component.template.dart' as self;

@Component(
  selector: 'Login',
  templateUrl: 'Login_component.html',
  styleUrls: ['Login_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class LoginComponent implements OnInit {
  Router _router;
  List<Hero> heroes;

  final WishYouService _heroService;

  LoginComponent(this._heroService);

 
 int userID;


    Future<NavigationResult> gotoChatRoom() =>
      _router.navigate("chatroom");
}


