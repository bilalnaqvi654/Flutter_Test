import 'package:fluttertask/Favpage.dart';
import 'package:fluttertask/Models/FavModel.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  Future<Database> get db async {
    Database _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'fav.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT,description TEXT ,imageUrl TEXT ,alchohlic TEXT )');
  }

  Future<FavouriteModel> add(FavouriteModel fav) async {
    var dbClient = await db;
    fav.id = (await dbClient.insert('student', fav.toMap()));
    return fav;
  }

  Future<List<FavouriteModel>> getFavs() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query('student',
        columns: ['id', 'name', 'description', 'imageUrl', 'alchohlic']);
    List<FavouriteModel> fav = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        fav.add(FavouriteModel.fromMap(maps[i]));
      }
    }
    return fav;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'student',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(FavouriteModel fav) async {
    var dbClient = await db;
    return await dbClient.update(
      'student',
      fav.toMap(),
      where: 'id = ?',
      whereArgs: [fav.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
