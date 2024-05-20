import 'package:sqflite/sqflite.dart';

import '../entity_model/cart_model.dart';

class DatabaseRepo{

  late Database myObjectDB;

  Future<void> initDB() async {
    myObjectDB = await openDatabase(
        (await getDatabasesPath()) + '/cartDB.db',
        version: 1,
        onCreate: (db, version){
          db.execute(''' CREATE TABLE home (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          tabs TEXT NOTNULL,
          image TEXT,
          productTitles TEXT,
          prices TEXT,
          quantity INTEGER,
          availableQuantity INTEGER,
          cart INTEGER,
        )''');
        }
    );
  }

  Future<List<cartModel>> fetchCart() async {
    return (await myObjectDB.query('cart')).map((e) => cartModel.fromjson(e)).toList();
  }




  Future<void> insertHomeProduct(String tabs, String image, String productTitle, String price,
      int quantity, int availableQuantity) async {
    await myObjectDB.insert('cart', {
      'tabs' : tabs,
      'image' : image,
      'productTitles' :productTitle,
      'prices' :price,
      'quantity':quantity,
      'availableQuantity':availableQuantity,
      'cart':0,
    });
  }

  void newQuantity(int qnt, int id){
    myObjectDB.update('cart', {
      'availableQuantity':qnt,
    }, where: 'id=?', whereArgs: [id]);
  }

  void updateCart(int value, int id){
    myObjectDB.update('cart', {
      'cart':value,
    }, where: 'id=?', whereArgs: [id]);
  }

  void deleteProduct(int id){
    myObjectDB.delete('cart', where: 'id=?', whereArgs: [id]);
  }


}