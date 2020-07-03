import 'package:WishYou/WishYou.dart';
class ChatRoom extends ManagedObject<_ChatRoom> implements _ChatRoom {}

class _ChatRoom {
  @primaryKey
  int roomID;

   @Column(unique: true)
  String roomName;

  @Column(unique: true)
  List<int> nameList;
}
