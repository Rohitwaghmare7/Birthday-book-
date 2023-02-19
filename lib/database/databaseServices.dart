import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'FriendsData.dart';

class DatabaseServices {
  late Future<Database>
      database; //making database global so that every function inside the class can access it.
  void initDatabase() async {
    // Open the database and store the reference.
    database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'friends.db'),
      // When the database is first created, create a table to store counters;
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(
          'CREATE TABLE friends(name varchar(50), no int, message int, dt varchar(50) )',
        );
        Fluttertoast.showToast(
            msg: "Table createdfinally",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  } //Function whatever () ends here

  // Define a function that inserts student into the database.
  Future<void> insertFriends(friends fri) async {
    try {
      final Database db = await database;

      await db.insert(
        'friends',
        fri.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      Fluttertoast.showToast(
          msg: "Record Inserted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "please insert correct details",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

//   Future<void> updateStudent(friends stud) async {
//     final Database db = await database;

//     await db
//         .update('friends', stud.toMap(), where: "id=?", whereArgs: [stud.id]);
//     Fluttertoast.showToast(
//         msg: "Record updated",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

  Future<void> deletefriend(String name) async {
    final Database db = await database;

    await db.delete('friends', where: "name=?", whereArgs: [name]);
    Fluttertoast.showToast(
        msg: "Record Deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

//   Future<List<Map<String, Object?>>> selectrecord(int id) async {
//     final Database db = await database;

//     List<Map<String, Object?>> rows =
//         await db.query("student", where: "id=?", whereArgs: [id]);
//     return rows;
//   }

  Future<List<Map<String, Object?>>> selectAllrecord() async {
    final Database db = await database;

    List<Map<String, Object?>> card = await db.query("friends");
    return card;
  }
}
