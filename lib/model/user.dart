import 'package:WishYou/WishYou.dart';
class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int userID;

  @Column(unique: true)
  String password;

  @Column(unique: true)
  String phone;

  @Column(unique: true)
  String nickName;

}

