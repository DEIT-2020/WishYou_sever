import 'package:aqueduct/aqueduct.dart';

class ChatRoomController extends ResourceController {
  ChatRoomController(this.context);

  final ManagedContext context;



@Operation.get()
  Future<Response> getAllHeroes() async {

    return Response.ok("1");
  }

  @Operation.get('userID')
  Future<Response> getuserByID(@Bind.path('userID') int userID) async {

    return Response.ok("1");
  }
}