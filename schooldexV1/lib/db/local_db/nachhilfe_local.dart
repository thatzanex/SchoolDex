import 'dart:io';
import '/models/nachhilfe.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NachhilfeLocalServices {
  // Singleton Pattern
  NachhilfeLocalServices._privateConstructor();
  static final NachhilfeLocalServices instance =
      NachhilfeLocalServices._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'schooldexnach.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE nachhilfen(
        id TEXT PRIMARY KEY,
        fach TEXT,
        jahrgang TEXT,
        beschreibung TEXT,
        userId TEXT,
        username TEXT,
        schulname TEXT
      )
    ''');
  }

  Future<List<Nachhilfe>> getAccount() async {
    Database db = await instance.database;
    var accounts = await db.query('nachhilfen', orderBy: 'id');
    List<Nachhilfe> accountList =
        accounts.map((e) => Nachhilfe.fromMap(e)).toList();
    return accountList;
  }

  Future<int> add(Nachhilfe item) async {
    Database db = await instance.database;
    return await db.insert('nachhilfen', item.toMapLocal());
  }

  Future<int> remove(String id) async {
    Database db = await instance.database;
    return await db.delete('nachhilfen', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Nachhilfe item) async {
    Database db = await instance.database;
    return await db.update('nachhilfen', item.toMapLocal(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
