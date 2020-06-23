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
    dynamic _users = [
{'userID':10021,'password':'10021','phone':'18018011802','nickName':'张三',},
{'userID':10001,'password':'10001','phone':'18018011803','nickName':'李四',},
{'userID':20002,'password':'20002','phone':'18018011804','nickName':'王五',},
{'userID':10002,'password':'10002','phone':'18018011805','nickName':'赵六',},
{'userID':10031,'password':'10031','phone':'18018011806','nickName':'小明',},
{'userID':10051,'password':'10051','phone':'18018011807','nickName':'李华',},
    ];
  @override
  void ngOnInit() async {
   
  }

  List<int> login_no = [1];
  List<int> login_yes = [];
  void gotoChatRoom(){
            login_no=[];
    login_yes=[1];
    bool a=false;
    for(var user in _users ){
      if(10051==_users.userID){
        a=true;
        login_no=[];
    login_yes=[1];
        break;
      }
    }
if(a){
      login_no=[];
    login_yes=[1];
}
else{
  print("redo_input");
}

}
}
