import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo{

  late Database myObjectDB;

  Future<void> initDB() async {
     myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/homeDB.db',
      version: 1,
      onCreate: (db, version){
        db.execute(''' CREATE TABLE home (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          tabs TEXT NOTNULL,
          image TEXT,
          productTitles TEXT,
          prices TEXT,
          reviews INTEGER,
          quantity INTEGER,
          availableQuantity INTEGER,
          favorite INTEGER,
          cart INTEGER,
        )''');
      }
    );
  }

  Future<List<homeModel>> fetchHome() async {
    return (await myObjectDB.query('home')).map((e) => homeModel.fromjson(e)).toList();
  }

  Future<List<homeModel>> fetchFavoriteHome() async {
    return (await myObjectDB.query('home', where:'favorite=?', whereArgs: [1])).map((e) => homeModel.fromjson(e)).toList();
  }

  Future<List<homeModel>> fetchCartHome() async {
    return (await myObjectDB.query('home', where:'cart=?', whereArgs: [1])).map((e) => homeModel.fromjson(e)).toList();
  }


  Future<void> insertHomeProduct(String tabs, String image, String productTitle, String price,
      int review, int quantity, int availableQuantity) async {
    await myObjectDB.insert('home', {
      'tabs' : tabs,
      'image' : image,
      'productTitles' :productTitle,
      'prices' :price,
      'reviews':review,
      'quantity':quantity,
      'availableQuantity':availableQuantity,
      'favorite':0,
      'cart':0,
    });
  }

  void newQuantity(int qnt, int id){
    myObjectDB.update('home', {
      'availableQuantity':qnt,
    }, where: 'id=?', whereArgs: [id]);
  }

  void updateFavorite(int value, int id){
    myObjectDB.update('home', {
      'favorite':value,
    }, where: 'id=?', whereArgs: [id]);
  }
  void updateCart(int value, int id){
    myObjectDB.update('home', {
      'cart':value,
    }, where: 'id=?', whereArgs: [id]);
  }

  void deleteProduct(int id){
    myObjectDB.delete('home', where: 'id=?', whereArgs: [id]);
  }


}