import 'package:angular/angular.dart';

import 'src/ContextList_component.dart';


@Component(
  selector: 'my-app',
template: '''
<ContextList>
</ContextList>
  ''',
  directives: [
    ContextListComponent,
  ],
)
class AppComponent {
}