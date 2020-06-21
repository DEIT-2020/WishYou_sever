import 'package:WishYou/WishYou.dart';
class Message extends ManagedObject<_Message> implements _Message {}

class _Message {
  @primaryKey
  int messageID;

  @Column(unique: true)
  String content;

  @Column(unique: true)
  int send;

  @Column(unique: true)
  int receive;

  @Column(unique: true)
  bool question;

  @Column(unique: true)
  int quote;

}