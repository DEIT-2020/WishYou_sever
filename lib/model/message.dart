import 'package:WishYou/WishYou.dart';
class Message extends ManagedObject<_Message> implements _Message {}

class _Message {
  @primaryKey
  String content;

  @Column(unique: true)
  String send;

  @Column(unique: true)
  String receive;

  @Column(unique: true)
  bool isquestion;

  @Column(unique: true)
  String messageID;

  @Column(unique: true)
  String quote;

}