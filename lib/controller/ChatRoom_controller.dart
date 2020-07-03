import 'package:WishYou/model/chatRoom.dart';
import 'package:WishYou/model/message.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:WishYou/WishYou.dart';

class ChatRoomController extends ResourceController {
  ChatRoomController(this.context);

  final ManagedContext context;


  @Operation.get()
  Future<Response> getRoomMessage({@Bind.query('roomID') String roomID}) async {
  final chatRoomQuery = Query<Message>(context);
  if (roomID != null) {
    chatRoomQuery.where((m) => m.receive).equalTo(roomID);
  }
  final message = await chatRoomQuery.fetch();

    if (message == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(message);
    }
  }

}
