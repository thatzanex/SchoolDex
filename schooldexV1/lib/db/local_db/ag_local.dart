import 'dart:io';
import '/models/ag.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AGLocalServices {
  // Singleton Pattern
  AGLocalServices._privateConstructor();
  static final AGLocalServices instance = AGLocalServices._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'schooldexag.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ags(
        id TEXT PRIMARY KEY,
        thema TEXT,
        jahrgang TEXT,
        beschreibung TEXT,
        termin TEXT,
        schulname TEXT,
        userId TEXT
      )
    ''');
  }

  Future<List<AGs>> getAccount() async {
    Database db = await instance.database;
    var accounts = await db.query('ags', orderBy: 'id');
    List<AGs> accountList = accounts.map((e) => AGs.fromMap(e)).toList();
    return accountList;
  }

  Future<int> add(AGs item) async {
    Database db = await instance.database;
    return await db.insert('ags', item.toMapLocal());
  }

  Future<int> remove(String id) async {
    Database db = await instance.database;
    return await db.delete('ags', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(AGs item) async {
    Database db = await instance.database;
    return await db.update('ags', item.toMapLocal(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
