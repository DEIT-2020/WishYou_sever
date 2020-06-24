import 'package:angular/angular.dart';
export 'dart:async';

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
  List<int> login_no = [];
  List<int> login_yes = [1];
//datebaseErea
  final users = [
    {
      'userID': "10021",
      'password': '10021',
      'phone': '18018011802',
      'nickName': '张三',
    },
    {
      'userID': "10001",
      'password': '10001',
      'phone': '18018011803',
      'nickName': '李四',
    },
    {
      'userID': "20002",
      'password': '20002',
      'phone': '18018011804',
      'nickName': '王五',
    },
    {
      'userID': "10002",
      'password': '10002',
      'phone': '18018011805',
      'nickName': '赵六',
    },
    {
      'userID': "10031",
      'password': '10031',
      'phone': '18018011806',
      'nickName': '小明',
    },
    {
      'userID': "10051",
      'password': '10051',
      'phone': '18018011807',
      'nickName': '李华',
    },
  ];
    List<String> messages = [
     "消息","消息","消息","消息","消息",
  ];

  
//variable
  String user = "user";
  String isquestion = "no";
  String message = "none";


  List<String> contexts = ["电子技术", "概率论", "马原", "电子技术2", "概率论2", "马原2"];
  @override
  void ngOnInit() async {}
  void send() {
    messages.add(message);
  }

  void thisIsQuestion() {
    isquestion = "yes";
  }

  void gotoChatRoom() {
    for (var loginUser in users) {
      if (user == loginUser["userID"]) {
        login_no = [];
        login_yes = [1];
        break;
      } else {
        login_no = [1];
        login_yes = [];
      }
    }
  }

  void inputuser(String term) {
    user = term;
  }

  void inputmessage(String term) {
    message = term;
  }
}
