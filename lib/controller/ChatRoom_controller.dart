import 'package:aqueduct/aqueduct.dart';
import 'package:WishYou/WishYou.dart';
import 'package:WishYou/model/user.dart';

class ChatRoomController extends ResourceController {
  ChatRoomController(this.context);

  final ManagedContext context;



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
