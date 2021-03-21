import 'dart:core';
import 'dart:io';

import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:sqflite/sqflite.dart' as sql;

class ClientDatabse {
  static const String tableName = "clients";
  static sql.Database? _database;
  static int get _version => 1;

  ///make singleton class
  ClientDatabse._privateConstructor();
  static final ClientDatabse instance = ClientDatabse._privateConstructor();

  //fields
  static const String keyName = "name";
  static const String keyPhone = "phone";
  static const String keyAddress = "address";
  static const String keyEmail = "email";
  static const String keyBalance = "balance";
  static const String keyImagePath = "imagePath";
  static const String ketAccCDate = 'accCrated';

  Future<sql.Database> get database async {
    // WidgetsFlutterBinding.ensureInitialized();
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database!;
  }

  Future<sql.Database> initDatabase() async {
    // print("creating DB");
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path + "clients.db");
    // Delete the database
    await sql.deleteDatabase(path);

    var clientDB = await sql.openDatabase(
      path,
      version: _version,
      onCreate: onCreateTable,
    );
    return clientDB;
  }

  void onCreateTable(sql.Database db, int newVersion) async {
    await db.execute('''
        CREATE TABLE $tableName ( id INTEGER PRIMARY KEY AUTOINCREMENT,
        $keyName TEXT, 
        $keyEmail TEXT, 
        $keyPhone TEXT, 
        $keyAddress TEXT, 
        $keyBalance TEXT, 
        $keyImagePath TEXT, 
        $ketAccCDate TEXT 
        )
        ''');

    // print("creating table");
    ///init dummyData
    // dummyData.forEach((element) async {
    // await insert(tableName, dummyData[0]);
    // await insert(tableName, dummyData[1]);

    // });
  }

  Future<int> insert(String table, Client client) async {
    final sql.Database db = await database;
    // `conflictAlgorithm` to use in case the same model is inserted twice.
    // In this case, replace any previous data.
    var result = await db.insert(
      table,
      client.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    print("inserted ${client.name}");
    return result;
  }

  Future<List<Client>> getClients(String table) async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert the List<Map<String, dynamic> into a List<Client>.
    return List.generate(maps.length, (i) {
      // print(maps[i].toString());
      return Client.fromMap(maps[i]);
    });
  }

  Future<int> update(Client client) async {
    final db = await database;

    var result = await db.update(
      tableName,
      client.toMap(),
      where: "$keyPhone = ? ",
      whereArgs: [client.phone],
    );
    // print("update : $result");
    return result;
  }

  // Future<int> transaction(Client sender, Client receiver, double amount) async {
  //   final db = await database;

  //   var senderMap = await db.rawQuery(
  //       "SELECT * FROM $tableName WHERE $keyName = ? AND $keyPhone = ?",
  //       [sender.name, sender.phone]);

  //   return 1;
  // }
}
