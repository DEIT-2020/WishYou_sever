import 'package:aqueduct/aqueduct.dart';
import 'package:WishYou/WishYou.dart';
import 'package:WishYou/model/user.dart';

class DemoController extends ResourceController {
  DemoController(this.context);

  final ManagedContext context;
  final _users = [
    {
      'userID': 10021,
      'password': '10021',
      'phone': '18018011802',
      'nickName': '张三',
    },
    {
      'userID': 10001,
      'password': '10001',
      'phone': '18018011803',
      'nickName': '李四',
    },
    {
      'userID': 20002,
      'password': '20002',
      'phone': '18018011804',
      'nickName': '王五',
    },
    {
      'userID': 10002,
      'password': '10002',
      'phone': '18018011805',
      'nickName': '赵六',
    },
    {
      'userID': 10031,
      'password': '10031',
      'phone': '18018011806',
      'nickName': '小明',
    },
    {
      'userID': 10051,
      'password': '10051',
      'phone': '18018011807',
      'nickName': '李华',
    },
  ];


  @Operation.get()
  Future<Response> getAllHeroes() async {
    final userQuery = Query<User>(context);
    final users = await userQuery.fetch();

    return Response.ok(users);
  }

  @Operation.get('userID')
  Future<Response> getuserByID(@Bind.path('userID') int userID) async {
    final userQuery = Query<User>(context)
      ..where((user) => user.userID).equalTo(userID);
    final user = await userQuery.fetchOne();

    if (user == null) {
      return Response.notFound();
    }
    return Response.ok(user);
  }

  
}
