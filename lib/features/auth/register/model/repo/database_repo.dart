import 'package:ecommerceapp/features/auth/register/model/entity_model/registerModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo{

  late Database myObjectDB;
  Future<void> initDB() async {
    try {
      myObjectDB = await openDatabase(
        (await getDatabasesPath()) + '/registerDB.db',
        version: 1,
        onCreate: (db, version) {
          db.execute('''
          CREATE TABLE register (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            phone TEXT,
            password TEXT,
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
    return (await myObjectDB.query('register')).map((e) => registerModel.fromjson(e)).toList();
  }
  Future<void> insertRegisterInfo(String name, String email, String phone, String password) async {
    // await myObjectDB.insert('homeDashboar', {
    //   'name' : name,
    //   'email' : email,
    //   'phone' :phone,
    //   'password' :password,
    // },
    // conflictAlgorithm: ConflictAlgorithm.replace,
    // );
  }

  void newPassword(int pass, int id){
    myObjectDB.update('register', {
      'password':pass,
    }, where: 'id=?', whereArgs: [id]);
  }


  Future<void> deleteProduct({int id = 1})async {
    myObjectDB.delete('register', where: 'id=?', whereArgs: [id]);
  }


}