import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_User", [SchemaColumn("userID", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("password", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("phone", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("nickName", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
     final _users = [
    {
      'userID': 10021,
      'password': '10021',
      'phone': '18018011802',
      'nickName': '张三',
    },
    {
      'userID': 10001,
      'password': '10001',
      'phone': '18018011803',
      'nickName': '李四',
    },
    {
      'userID': 20002,
      'password': '20002',
      'phone': '18018011804',
      'nickName': '王五',
    },
    {
      'userID': 10002,
      'password': '10002',
      'phone': '18018011805',
      'nickName': '赵六',
    },
    {
      'userID': 10031,
      'password': '10031',
      'phone': '18018011806',
      'nickName': '小明',
    },
    {
      'userID': 10051,
      'password': '10051',
      'phone': '18018011807',
      'nickName': '李华',
    },
  ];

  for (final user in _users) {    
    await database.store.execute("INSERT INTO _User (userID) VALUES (@userID)", substitutionValues: {
      "userID": user["userID"]
    });
    await database.store.execute("INSERT INTO _User (password) VALUES (@password)", substitutionValues: {
      "password": user["password"]
    });
    await database.store.execute("INSERT INTO _User (phone) VALUES (@phone)", substitutionValues: {
      "phone": user["password"]
    });
    await database.store.execute("INSERT INTO _User (nickName) VALUES (@nickName)", substitutionValues: {
      "nickName": user["nickName"]
    });
  }
  }
  
}
    