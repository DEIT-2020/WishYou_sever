import 'package:WishYou/model/chatRoom.dart';
import 'package:WishYou/model/message.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:WishYou/WishYou.dart';

class SendMessageController extends ResourceController {
  SendMessageController(this.context);

  final ManagedContext context;


  @Operation.post()
  Future<Response> sendmessage(@Bind.body() Message newmessage) async {
    final postquery = Query<Message>(context)
  ..values = newmessage;
    final nmessage = await postquery.insert();

    return Response.ok(nmessage);
  }

}