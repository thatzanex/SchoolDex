import 'dart:io';
import '/models/news.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsLocalServices {
  // Singleton Pattern
  NewsLocalServices._privateConstructor();
  static final NewsLocalServices instance =
      NewsLocalServices._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'news.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE account(
        id TEXT PRIMARY KEY,
        ueberschrift TEXT,
        inhalt TEXT,
        userId TEXT,
        schulname TEXT
      )
    ''');
  }

  Future<List<News>> getAccount() async {
    Database db = await instance.database;
    var accounts = await db.query('news', orderBy: 'id');
    List<News> accountList = accounts.map((e) => News.fromMap(e)).toList();
    return accountList;
  }

  Future<int> add(News item) async {
    Database db = await instance.database;
    return await db.insert('news', item.toMapLocal());
  }

  Future<int> remove(String id) async {
    Database db = await instance.database;
    return await db.delete('news', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(News item) async {
    Database db = await instance.database;
    return await db.update('news', item.toMapLocal(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
