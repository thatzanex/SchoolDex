import 'dart:io';
import '/models/blackboard.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BlackboardLocalServices {
  // Singleton Pattern
  BlackboardLocalServices._privateConstructor();
  static final BlackboardLocalServices instance =
      BlackboardLocalServices._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'schooldexusblackborder.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE blackboard(
        id TEXT PRIMARY KEY,
        ueberschrift TEXT,
        beschreibung TEXT,
        color TEXT,
        datum TEXT,
        userId TEXT,
        username TEXT,
        schulname TEXT
      )
    ''');
  }

  Future<List<Blackboard>> getAccount() async {
    Database db = await instance.database;
    var accounts = await db.query('blackboard', orderBy: 'id');
    List<Blackboard> accountList =
        accounts.map((e) => Blackboard.fromMap(e)).toList();
    return accountList;
  }

  Future<int> add(Blackboard item) async {
    Database db = await instance.database;
    return await db.insert('blackboard', item.toMapLocal());
  }

  Future<int> remove(String id) async {
    Database db = await instance.database;
    return await db.delete('blackboard', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Blackboard item) async {
    Database db = await instance.database;
    return await db.update('blackboard', item.toMapLocal(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
