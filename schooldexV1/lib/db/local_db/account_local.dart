import 'dart:io';
import '/models/account.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalServices {
  // Singleton Pattern
  LocalServices._privateConstructor();
  static final LocalServices instance = LocalServices._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'schoolaccount.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE accounts(
        id TEXT PRIMARY KEY,
        benutzername TEXT,
        hash TEXT,
        salt TEXT,
        generator TEXT,
        status TEXT,
        schulname TEXT
      )
    ''');
  }

  Future<List<Account>> getAccount() async {
    Database db = await instance.database;
    var accounts = await db.query('accounts', orderBy: 'id');
    List<Account> accountList =
        accounts.map((e) => Account.fromMapLocal(e)).toList();
    return accountList;
  }

  Future<int> add(Account item) async {
    Database db = await instance.database;
    return await db.insert('accounts', item.toMapLocal());
  }

  Future<int> remove(String id) async {
    Database db = await instance.database;
    return await db.delete('accounts', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Account item) async {
    Database db = await instance.database;
    return await db.update('accounts', item.toMapLocal(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
