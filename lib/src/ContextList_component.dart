import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'ContextList_component.dart';
import 'hero.dart';
import 'WishYou_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'ContextList',
  templateUrl: 'ContextList_component.html',
  styleUrls: ['ContextList_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
)
class ContextListComponent implements OnInit {
    List<int> heroes = [1,2,3,4,5  ];
  @override
  void ngOnInit() async {
   
  }
    List<int> login_no = [1];
  List<int> login_yes = [];
  void gotoChatRoom(){
    login_no=[];
    login_yes=[1];
}
}
