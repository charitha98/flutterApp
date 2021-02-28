
import 'package:sd012020/Models/Drug.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class   DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'drug_test_3.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE drug (id INTEGER PRIMARY KEY, drugName TEXT, drugDosage TEXT, drugPerTake TEXT, drugTakeStatus INTEGER)');
    print('******************* DB created *****************\n***************8\n*************');

  }

  Future<Drug> add(Drug drug) async {
    var dbClient = await db;
    print(drug.toMap());
    drug.id = await dbClient.insert('drug', drug.toMap());
    print('********************value added*****************\n***************8\n*************');

    return drug;
  }

  Future<List<Drug>> getDrugs() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('drug', columns: ['id', 'drugName', 'drugDosage', 'drugPerTake', 'drugTakeStatus']);
    List<Drug> drugs = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        drugs.add(Drug.fromMap(maps[i]));
        print(maps[i]);
      }
    }
    return drugs;
  }

  Future<int> delete(Drug drug) async {
    var dbClient = await db;
    return await dbClient.delete(
      'drug',
      where: 'id = ?',
      whereArgs: [drug.id],
    );
  }

  Future<int> update(Drug drug) async {
    var dbClient = await db;
    return await dbClient.update(
      'drug',
      drug.toMap(),
      where: 'id = ?',
      whereArgs: [drug.id],
    );
  }

  Future<int> updateDrugState(Drug drug) async {
    var dbClient = await db;
    return await dbClient.update(
      'drug',
      drug.toMap(),
      where: 'id = ?',
      whereArgs: [drug.id],
    );
  }


  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}