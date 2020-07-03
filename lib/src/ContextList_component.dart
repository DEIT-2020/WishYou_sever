import 'package:angular/angular.dart';
import 'dart:async';

@Component(
  selector: 'ContextList',
  templateUrl: 'ContextList_component.html',
  styleUrls: ['ContextList_component.css'],
  directives: [
    coreDirectives,
  ],
)
class ContextListComponent implements OnInit {
//缓存
  bool hadLogin = false;
  bool ifQuote = false;
//初始化

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
        hadLogin = true;
        break;
      } else {
        //拒绝登录
        hadLogin = false;
      }
    }
  }

//登录
  var user_now = {
    'userID': '',
    'password': '',
    'phone': '',
    'nickName': ''
  };
  void inputuser(String term) {
    user_now["userID"] = term;
  }

  void inputPassword(String term) {
    user_now["password"] = term;
  }

  void gotoChatRoom() {
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
        hadLogin = true;
        break;
      } else {
        //拒绝登录
        hadLogin = false;
      }
    }
  }

  //选择聊天室
  var roomListNow = [];
  var roomNameListNow = [];
  var messageListNow = [];
  var questionListNow = [];

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

//发送信息
  String roomNow = "";
  String roomIDNow = "";
  String sendMessageQuote = "";
  String sendMessageID = "";
  String sendMessageReceive = "";
  String sendMessageSend = "";
  String sendMessageContent = "";
  String sendMessageNickName = "";
  String quoteContent = "";
  bool sendMessageIsQuestion = false;
  bool sendhadQuote = true;

  void inputmessage(String term) {
    sendMessageContent = term;
  }

  void send() {
    var nowTime;
    String sendTime;
    sendMessageSend = user_now["userID"];
    sendMessageNickName = user_now["nickName"];
    sendMessageReceive = roomIDNow;
    nowTime = new DateTime.now();
    sendTime = nowTime.toString();
    sendMessageID = sendTime + "_" + sendMessageSend;
    messages.add(
      {
        'content': sendMessageContent,
        'send': sendMessageSend,
        'nickName':sendMessageNickName,
        'receive': sendMessageReceive,
        'isQuestion': sendMessageIsQuestion,
        'quote': sendMessageQuote,
        'quoteContent':quoteContent,
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
    quoteContent = term["content"];
    sendhadQuote = true;
    ifQuote = true;
  }

  void requote(var term) {
    sendMessageQuote = term["messageID"];
    quoteContent = term["content"];
    sendhadQuote = true;
    ifQuote = true;
    sendMessageIsQuestion = true;
  }

  void cancelQuote() {
    ifQuote = false;
    sendhadQuote = false;
  }

  void thisIsQuestion() {
    sendMessageIsQuestion = true;
  }

//创建聊天室
  String aContext="";
  String aRoomName="";
  String aRoomID="";
  List contextList = [];
  void inputroom(String term) {
    aRoomName = term;
  }

  void inputContext(String term) {
    aContext = term;
  }

  void add_Context() {
    contextList.add(aContext);
  }

  void addRoom() {
    roomNameListNow=[];
    roomListNow=[];
    var aTime = new DateTime.now();
    String theTime = aTime.toString();
    aRoomID = theTime + "_" + sendMessageSend;
    chatRooms.add(
      {'nameList': contextList, 'roomID': aRoomID, 'roomName': aRoomName},
    );
    
    for (var aRoom in chatRooms) {
      for (var roomUser in aRoom["nameList"]) {
        if (user_now["userID"] == roomUser) {
          roomListNow.add(aRoom);
          roomNameListNow.add(aRoom["roomName"]);
          break;
        }
      }
    }
  }

  //datebaseErea
  var users = [
    {
      'userID': "10021",
      'password': '10021',
      'phone': '18018011802',
      'nickName': '张三',
    },
    {
      'userID': "10081",
      'password': '10081',
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
      "roomID": "2020-06-24 11:35:59.675_10021",
      "roomName": "学习技术系统开发"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "2020-06-24 11:25:59.675_10021",
      "roomName": "概率论与数理统计"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "2020-06-24 11:36:59.675_10021",
      "roomName": "马原（马克思主义基本原理概论）"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "2020-06-24 11:37:59.675_10021",
      "roomName": "电子技术综合"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "2020-06-24 11:40:59.675_10021",
      "roomName": "计算机动画技术"
    },
    {
      "nameList": ["10021", '10051', '10031'],
      "roomID": "2020-06-24 11:50:59.675_10021",
      "roomName": "影视创作"
    }
  ];
  var messages = [
    {
      'content': "开始上课了，记得超星签到",
      'send': "10021",
      'nickName': '张三',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      // 'quoteContent':"1",
      'messageID': "2020-06-24 11:35:59.675_10021"
    },
    {
      'content': "来了",
      'send': "10051",
      'nickName': '李华',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:36:59.675_10021"
    },
    {
      'content': "来了",
      'send': "10031",
      'nickName': '小明',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:36:59.675_10021"
    },
    {
      'content': "来了",
      'send': "20002",
      'nickName': '王五',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:38:59.675_10021"
    },
    {
      'content': "assert语句直接运行无法得出结果怎么办？求大神",
      'send': "10021",
      'nickName': '张三',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:37:59.675_10021"
    },
    {
      'content': "要用dart --enable-asserts xxx.dart执行",
      'send': "10051",
      'nickName': '李华',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:39:59.675_10021"
    },
    {
      'content': "亲测xxx.dart得加上双引号",
      'send': "10031",
      'nickName': '小明',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:40:59.675_10021"
    },  
    {
      'content': "出现dictionary is not empty情况怎么处理呀？",
      'send': "10051",
      'nickName': '李华',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:37:59.675_10021"
    },
    {
      'content': "可以新建一个文件夹，然后打开这个文件夹再运行stagehand的命令",
      'send': "10021",
      'nickName': '张三',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quoteContent': "出现dictionary is not empty情况怎么处理呀？",
      'messageID': "2020-06-24 11:38:59.675_10021"
    },
    {
      'content': "谢谢",
      'send': "10051",
      'nickName': '李华',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:39:59.675_10021"
    },
    {
      'content': "server爆红了TT",
      'send': "10081",
      'nickName': '李四',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': true,
      'quote': "",
      'messageID': "2020-06-24 11:41:59.675_10021"
    },
    {
      'content': "sever下载以后大量爆红解决办法：1下载包 pub global activate aqueduct aqueduct pub get 2修改引用路径（两种办法） import 'package:heroes/heroes.dart'; （1）把pubspec.yaml里面的name改成heroes（推荐这钟，就不用再一个个文件改引用前面的heroes）（2）把前面的heroes改成sever（和pubspec.yaml里面的name后面保持一致）",
      'send': "10002",
      'nickName': '赵六',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:42:59.675_10021"
    },
    {
      'content': "大神来了",
      'send': "20002",
      'nickName': '王五',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:43:59.675_10021"
    },
    {
      'content': "@赵六 你可以把解决方案放到github quesntion and answer issues中",
      'send': "10021",
      'nickName': '张三',
      'receive': "2020-06-24 11:35:59.675_10021",
      'isQuestion': false,
      'quote': "",
      'messageID': "2020-06-24 11:43:59.675_10021"
    },
  ];
}
