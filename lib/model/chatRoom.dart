import 'package:WishYou/WishYou.dart';
class ChatRoom extends ManagedObject<_ChatRoom> implements _ChatRoom {}

class _ChatRoom {
  @primaryKey
  String roomID;

  @Column(unique: true)
  List<String> nameList;

  @Column(unique: true)
  String roomName;
}
