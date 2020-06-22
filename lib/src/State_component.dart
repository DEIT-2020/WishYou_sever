import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'State',
  templateUrl: 'State_component.html',
  styleUrls: ['State_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class StateComponent implements OnInit {
  List<Hero> heroes;

  final WishYouService _heroService;

  StateComponent(this._heroService);

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }
}
