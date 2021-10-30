import 'dart:ffi';

import 'package:ecommerce_store/model/cart_pruduct_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database? _db;
  createDatabse() async {
    if (_db != null) {
      return _db;
    }
    //define path to database
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        //create tables
        db.execute(
            "create table pruducts(id integer primary key autoincrement,name text ,image text,price integer ,count integer)");
      },
    );
    return _db;
  }

  Future<int> createPruduct(CartPruduct pruduct) async {
    Database db = await createDatabse();
    return db.insert('pruducts', pruduct.toMap()).then((value) {
      print("the id inserted $value");
      return value;
    });
  }

  Future<List<Map<String, Object?>>> allPruducts() async {
    Database db = await createDatabse();
    return db.query("pruducts");
  }

  Future<int> delete(int id) async {
    Database db = await createDatabse();
    return db.delete('pruducts', where: 'id = ?', whereArgs: [id]);
  }

  void claerTable() async {
    Database db = await createDatabse();
    db.execute('delete from pruducts');
  }

  Future<int> update(CartPruduct pruduct) async {
    Database db = await createDatabse();
    return db.update('pruducts', pruduct.toMap(),
        where: 'id = ?', whereArgs: [pruduct.id]);
  }
}
