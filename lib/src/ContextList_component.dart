import 'package:angular/angular.dart';
export 'dart:async';
import 'package:http/http.dart' as http;
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
  var client = new http.Client();
  var url = 'http://localhost:8888';

  List<int> login_no = [1];
  List<int> login_yes = [];
//variable
  var user_now = {'userID': "", 'password': '', 'phone': '', 'nickName': ''};
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

  void gotoChatRoom(){
    String loginMessage = user_now["userID"] + "_" + user_now["password"];
    String loginRequestUrl = url + "/login/" + loginMessage;

    http.get(loginRequestUrl,headers:{"User-Agent":"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0"}).then((response) {
      var loginData = jsonDecode(response.body);
      roomListNow = loginData[0]["roomListNow"];
      roomNameListNow = loginData[0]["roomNameListNow"];
      ifLogin = loginData[0]["ifLogin"];
      user_now = loginData[0]["user_now"];
    });
    if (ifLogin) {
      login_no = [];
      login_yes = [1];
    } else {
      login_no = [1];
      login_yes = [];
    }
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

  void quote(var term) {
    sendMessageQuote = term["messageID"];
    sendhadQuote = true;
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

//datebaseErea
  var users = [
    {
      "userID": "10021",
      "password": "10021",
      "phone": "18018011802",
      "nickName": "张三"
    },
    {
      "userID": "10001",
      "password": "10001",
      "phone": "18018011803",
      "nickName": "李四"
    },
    {
      "userID": "20002",
      "password": "20002",
      "phone": "18018011804",
      "nickName": "王五"
    },
    {
      "userID": "10002",
      "password": "10002",
      "phone": "18018011805",
      "nickName": "赵六"
    },
    {
      "userID": "10031",
      "password": "10031",
      "phone": "18018011806",
      "nickName": "小明"
    },
    {
      "userID": "10051",
      "password": "10051",
      "phone": "18018011807",
      "nickName": "李华"
    }
  ];
  var chatRooms = [
    {
      "nameList": ["10021", "10051", "10002"],
      "roomID": "0001",
      "roomName": "电子技术"
    },
    {
      "nameList": ["10021", "10051", "10031"],
      "roomID": "0002",
      "roomName": "概率论"
    },
    {
      "nameList": ["10021", "10051", "10031"],
      "roomID": "0003",
      "roomName": "马原"
    },
    {
      "nameList": ["10021", "10051", "10031"],
      "roomID": "0004",
      "roomName": "电子技术2"
    },
    {
      "nameList": ["10021", "10051", "10031"],
      "roomID": "0005",
      "roomName": "概率论2"
    },
    {
      "nameList": ["10021", "10051", "10031"],
      "roomID": "0006",
      "roomName": "马原2"
    }
  ];
  var messages = [
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": true,
      "quote": "",
      "messageID": "2020-06-24 11:35:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": true,
      "quote": "",
      "messageID": "2020-06-24 11:37:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": false,
      "quote": "",
      "messageID": "2020-06-24 11:38:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": false,
      "quote": "",
      "messageID": "2020-06-24 11:39:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": false,
      "quote": "",
      "messageID": "2020-06-24 11:40:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": false,
      "quote": "",
      "messageID": "2020-06-24 11:41:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": true,
      "quote": "",
      "messageID": "2020-06-24 11:42:59.675_10021"
    },
    {
      "content": "message",
      "send": "10021",
      "receive": "0001",
      "isQuestion": true,
      "quote": "",
      "messageID": "2020-06-24 11:43:59.675_10021"
    },
    {
      "content": "message",
      "send": "10051",
      "receive": "0001",
      "isQuestion": false,
      "quote": "2020-06-24 11:35:59.675_10021",
      "messageID": "2020-06-24 11:36:59.675_10021"
    },
    {
      "content": "message",
      "send": "10051",
      "receive": "0001",
      "isQuestion": false,
      "quote": "2020-06-24 11:35:59.675_10021",
      "messageID": "2020-06-24 11:37:59.675_10021"
    },
    {
      "content": "message",
      "send": "10051",
      "receive": "0001",
      "isQuestion": false,
      "quote": "2020-06-24 11:35:59.675_10021",
      "messageID": "2020-06-24 11:38:59.675_10021"
    },
    {
      "content": "message",
      "send": "10051",
      "receive": "0001",
      "isQuestion": true,
      "quote": "",
      "messageID": "2020-06-24 11:39:59.675_10021"
    },
  ];
  @override
  void ngOnInit() async {}
}
