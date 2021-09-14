import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/User.dart';
import 'package:modak/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBRepository().saveUser(User(userid: "test", level: 0));
  await DBRepository().saveUser(User(userid: "test2", level: 1));
  print(await DBRepository().loadUser());

  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text("test"),
      ),
    ),
  ));
}

class DBRepository {
  Future saveUser(User user) async {
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'modak.db'),
      onCreate: (db, version) {
        return db.execute(
            'create table user (userid text primary key, level integer)');
      },
      version: 2,
    );

    await database.delete('user');
    await database.insert('user', user.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    print("saved");

  }

  Future<User> loadUser() async {
    print("load..");
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'modak.db'),
      version: 1,
    );

    var users = await database.query('user');

    return User(userid: users[0]['userid'].toString(), level: int.parse(users[0]['level'].toString()));
  }
}
