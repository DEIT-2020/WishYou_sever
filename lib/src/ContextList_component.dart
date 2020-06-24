import 'dart:async';

import 'package:angular/angular.dart';
export 'dart:async';

@Component(
  selector: 'ContextList',
  templateUrl: 'ContextList_component.html',
  // templateUrl: '1.html',
  styleUrls: ['ContextList_component.css'],
  directives: [
    coreDirectives,
  ],
)
class ContextListComponent implements OnInit {
  List<int> login_no = [1];
  List<int> login_yes = [];
//datebaseErea
  var users = [
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
  var chatRooms = [
    {
      "nameList": ["10021", '10051', '10002'],
      "roomID": 0001,
      "roomName": "电子技术"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": 0002,
      "roomName": "概率论"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": 0003,
      "roomName": "马原"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": 0004,
      "roomName": "电子技术2"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": 0005,
      "roomName": "概率论2"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": 0006,
      "roomName": "马原2"
    }
  ];
  var sendTime = new DateTime.now();

  var messages = [
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:35:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:37:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:38:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:39:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:40:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:41:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:42:59.675_10021"
    },
    {
      'content': "message",
      'send': "10021",
      'receive': "0001",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:43:59.675_10021"
    },
    {
      'content': "message",
      'send': "10051",
      'receive': "0001",
      'isQuestion': false,
      'quote': "2020-06-24 11:35:59.675_10021",
      'messageID': "2020-06-24 11:36:59.675_10021"
    },
    {
      'content': "message",
      'send': "10051",
      'receive': "0001",
      'isQuestion': false,
      'quote': "2020-06-24 11:35:59.675_10021",
      'messageID': "2020-06-24 11:37:59.675_10021"
    },
    {
      'content': "message",
      'send': "10051",
      'receive': "0001",
      'isQuestion': false,
      'quote': "2020-06-24 11:35:59.675_10021",
      'messageID': "2020-06-24 11:38:59.675_10021"
    },
    {
      'content': "message",
      'send': "10051",
      'receive': "0001",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:39:59.675_10021"
    },
    
  ];

//variable
  var user_now = {'userID': "", 'password': '', 'phone': '', 'nickName': ''};
  String isquestion = "no";
  String message = "none";
  String roomNow = "";

  @override
  void ngOnInit() async {}
  void send() {

    sendTime = new DateTime.now();
  }

  void thisIsQuestion() {
    isquestion = "yes";
  }

  void gotoChatRoom() {
    for (var loginUser in users) {
      if ((user_now["userID"] == loginUser["userID"]) &&
          (user_now["password"] == loginUser["password"])) {
        login_no = [];
        login_yes = [1];
        user_now["phone"] = loginUser["phone"];
        user_now["nickName"] = loginUser["nickName"];
        break;
      } else {
        login_no = [1];
        login_yes = [];
      }
    }
  }

  void inputuser(String term) {
    user_now["userID"] = term;
  }

  void inputPassword(String term) {
    user_now["password"] = term;
  }

  void inputmessage(String term) {
    message = term;
  }

  void selectRoom(var term) {
    roomNow = term["roomID"];
  }
}
