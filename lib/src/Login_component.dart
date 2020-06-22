import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';

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

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

    String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

    Future<NavigationResult> gotoDetail(Hero hero) =>
      _router.navigate(_heroUrl(hero.id));
}
