import 'package:aqueduct/aqueduct.dart';
import 'dart:convert';

class MyappController extends ResourceController {
  MyappController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllHeroes() async {
    return Response.ok("1");
  }

  @Operation.get('userID')
  Future<Response> getuserByID(@Bind.path('userID') String userID) async {
    var user_now = {'userID': "", 'password': '', 'phone': '', 'nickName': ''};
    var splitUser = userID.split("_");
    var roomListNow = [];
    var roomNameListNow = [];
    String theUser = splitUser[0];
    String thePassword = splitUser[1];
    bool ifLogin = false;

    for (var loginUser in users) {
      //存储用户识别信息
      if ((theUser == loginUser["userID"]) &&
          (thePassword == loginUser["password"])) {
        user_now["userID"] = theUser;
        user_now["nickName"] = loginUser["nickName"];
        user_now["phone"] = loginUser["phone"];
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
        ifLogin = true;
        break;
      } else {
        //拒绝登录
        ifLogin = false;
      }
    }
    var loginAnswer = [
  {
    "roomListNow": roomListNow,
    "roomNameListNow": roomNameListNow,
    "ifLogin": ifLogin,
    "user_now": user_now
  }];
if(ifLogin){
return Response.ok(loginAnswer);
}else{
  return Response.notFound();
}
    
  }
}

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
