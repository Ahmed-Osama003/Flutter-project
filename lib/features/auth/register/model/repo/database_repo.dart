import 'package:ecommerceapp/features/auth/register/model/entity_model/registerModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  late Database myObjectDB;

  Future<void> initDB() async {
    try {
      myObjectDB = await openDatabase(
        (await getDatabasesPath()) + '/databaseDB.db',
        version: 1,
        onCreate: (db, version) {
          db.execute('''
          CREATE TABLE ppd (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            phone TEXT,
            password TEXT
          )
          ''');
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      // Handle the error, e.g., display a user-friendly message
    }
  }

  Future<List<registerModel>> fetchRegister() async {
    try {
      final List<Map<String, dynamic>> maps = await myObjectDB.query('ppd');
      return List.generate(maps.length, (i) {
        return registerModel.fromjson(maps[i]);
      });
    } catch (e) {
      print('Error fetching register data: $e');
      return [];
    }
  }

  Future<void> insertRegisterInfo(String name, String email, String phone, String password) async {
    try {
      await myObjectDB.insert(
        'ppd',
        {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error inserting register info: $e');
    }
  }

  void newPassword(String pass, int id) {
    myObjectDB.update(
      'ppd',
      {
        'password': pass,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteProduct({int id = 1}) async {
    try {
      await myObjectDB.delete(
        'ppd',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  Future<bool> checkEmailExists(String name) async {
    try {
      final List<Map<String, dynamic>> result = await myObjectDB.query(
        'ppd',
        where: 'name = ?',
        whereArgs: [name],
      );
      return result.isNotEmpty;
    } catch (e) {
      print('Error checking email: $e');
      return false;
    }
  }

}
