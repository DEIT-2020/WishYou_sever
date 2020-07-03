import 'package:WishYou/model/chatRoom.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:WishYou/WishYou.dart';

class CreateChatRoomController extends ResourceController {
  CreateChatRoomController(this.context);

  final ManagedContext context;


  @Operation.post()
  Future<Response> createroom(@Bind.body() ChatRoom newroominfo) async {
    final postquery = Query<ChatRoom>(context)
  ..values = newroominfo;
    final newroom = await postquery.insert();

    return Response.ok(newroom);
  }

}
