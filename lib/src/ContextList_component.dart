import 'package:angular/angular.dart';

@Component(
  selector: 'ContextList',
  // templateUrl: 'ContextList_component.html',
  templateUrl: '1.html',
  styleUrls: ['ContextList_component.css'],
  directives: [
    coreDirectives,
  ],
)
class ContextListComponent implements OnInit {
  List<int> heroes = [1, 2, 3, 4, 5];
  List<int> login_no = [1];
  List<int> login_yes = [];
List<String> users=["10021","10001","20002","10002","10031","10051",];
String user="user";
  @override
  void ngOnInit() async {}

  void gotoChatRoom() {
    for(var loginUser in users){
      if(user==loginUser){
    login_no = [];
    login_yes = [1];
    break;
      }
      else{
    login_no = [1];
    login_yes = [];

      }
    }
  }
   void inputuser(String term){
    user=term; 
   }
}
