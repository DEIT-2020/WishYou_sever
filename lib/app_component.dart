import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/WishYou_service.dart';
import 'src/ContextList_component.dart';


@Component(
  selector: 'my-app',
template: '''
<ContextList>
</ContextList>
  ''',
  directives: [
    routerDirectives,
    ContextListComponent,
  ],
  providers: [ClassProvider(WishYouService)],
)
class AppComponent {
}