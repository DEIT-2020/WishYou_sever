import 'package:aqueduct/aqueduct.dart';
import 'package:WishYou/model/user.dart';

class LoginController extends ResourceController {
  LoginController(this.context);

  final ManagedContext context;

@Operation.get('userID')
  Future<Response> getUserID(@Bind.path('userID') String userID) async {
  final userQuery = Query<User>(context)
    ..where((u) => u.userID).equalTo(userID);   
  final user = await userQuery.fetchOne();

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }

}