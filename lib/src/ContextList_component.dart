import 'package:http/http.dart' as http;
import 'package:angular/angular.dart';
import 'dart:async';
import 'dart:convert';

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
  List<int> quote_no = [1];
  List<int> quote_yes = [];

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
      "roomID": "0001",
      "roomName": "学习技术系统开发"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "0002",
      "roomName": "概率论与数理统计"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "0003",
      "roomName": "马原（马克思主义基本原理概论）"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "0004",
      "roomName": "电子技术综合"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "0005",
      "roomName": "计算机动画技术"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "0006",
      "roomName": "影视创作"
    }
  ];
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
  var user_now = {'userID': "10021", 'password': '10021', 'phone': '', 'nickName': ''};
  bool ifLogin = false;
  String roomNow = "";
  String roomIDNow = "";
  String sendMessageQuote = "";
  String sendMessageID = "";
  String sendMessageReceive = "";
  String sendMessageSend = "";
  String sendMessageContent = "";
  bool sendMessageIsQuestion = false;
  bool sendhadQuote = false;
  var roomListNow = [];
  var roomNameListNow = [];
  var messageListNow = [];
  var questionListNow = [];
  var charset;

  @override
  void ngOnInit() async {

        for (var loginUser in users) {
      //存储用户识别信息
      if ((user_now["userID"] == loginUser["userID"]) &&
          (user_now["password"] == loginUser["password"])) {
        user_now["phone"] = loginUser["phone"];
        user_now["nickName"] = loginUser["nickName"];
        //加载聊天室
        for (var aRoom in chatRooms) {
          for (var roomUser in aRoom["nameList"]) {
            if (user_now["userID"] == roomUser) {
              roomListNow.add(aRoom);
              roomNameListNow.add(aRoom["roomName"]);
              break;
            }
          }
        }
        //登录
        login_no = [];
        login_yes = [1];
        break;
      } else {
        //拒绝登录
        login_no = [1];
        login_yes = [];
      }
    }
  }

  var client = new http.Client();
  var url = 'http://localhost:8888';

  void gotoChatRoom() {


 }
  void inputuser(String term) {
    user_now["userID"] = term;
  }

  void inputPassword(String term) {
    user_now["password"] = term;
  }
  
  void inputmessage(String term) {
    sendMessageContent = term;
  }

  void send() {
    var nowTime;
    String sendTime;
    sendMessageSend = user_now["userID"];
    sendMessageReceive = roomIDNow;
    nowTime = new DateTime.now();
    sendTime = nowTime.toString();
    sendMessageID = sendTime + "_" + sendMessageSend;
    messages.add(
      {
        'content': sendMessageContent,
        'send': sendMessageSend,
        'receive': sendMessageReceive,
        'isQuestion': sendMessageIsQuestion,
        'quote': sendMessageQuote,
        'messageID': sendMessageID
      },
    );
    sendMessageQuote = "";
    sendMessageID = "";
    sendMessageReceive = "";
    sendMessageSend = "";
    sendMessageContent = "";
    sendMessageIsQuestion = false;
    sendhadQuote = false;
    messageListNow = [];
    questionListNow = [];
    for (var aMessage in messages) {
      if (roomIDNow == aMessage["receive"]) {
        messageListNow.add(aMessage);
        if (aMessage["isQuestion"]) {
          questionListNow.add(aMessage);
        }
      }
    }
  }

  void quote(var term) {
    sendMessageQuote = term["messageID"];
sendhadQuote=true;
quote_no = [];
quote_yes = [1];
  }

  void cancelQuote(){
quote_no = [1];
quote_yes = [];
sendhadQuote=false;
  }

  void thisIsQuestion() {
    sendMessageIsQuestion = true;
  }

  void selectRoom(String term) {
    messageListNow = [];
    questionListNow = [];

    roomNow = term;
    for (var aRoom in chatRooms) {
      if (roomNow == aRoom["roomName"]) {
        roomIDNow = aRoom["roomID"];
      }
    }

    for (var aMessage in messages) {
      if (roomIDNow == aMessage["receive"]) {
        messageListNow.add(aMessage);
        if (aMessage["isQuestion"]) {
          questionListNow.add(aMessage);
        }
      }
    }
  }
}
