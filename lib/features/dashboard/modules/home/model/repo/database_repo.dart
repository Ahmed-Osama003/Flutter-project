import 'package:ecommerceapp/features/dashboard/modules/home/model/entity_model/homeModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo{

  late Database myObjectDB;
  Future<void> initDB() async {
    try {
      myObjectDB = await openDatabase(
        (await getDatabasesPath()) + '/myHomeDB.db',
        version: 1,
        onCreate: (db, version) {
          db.execute('''
          CREATE TABLE homeDashboa (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tabs TEXT NOT NULL,
            image TEXT,
            productTitles TEXT,
            prices TEXT,
            reviews INTEGER,
            quantity INTEGER,
            availableQuantity INTEGER,
            favorite INTEGER,
            cart INTEGER
          )
        ''');
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      // Handle the error, e.g., display a user-friendly message
    }
  }

  Future<List<homeModel>> fetchHome() async {
    return (await myObjectDB.query('homeDashboa')).map((e) => homeModel.fromjson(e)).toList();
  }

  Future<List<homeModel>> fetchFavoriteHome() async {
    return (await myObjectDB.query('homeDashboa', where:'favorite=?', whereArgs: [1])).map((e) => homeModel.fromjson(e)).toList();
  }

  Future<List<homeModel>> fetchCartHome() async {
    return (await myObjectDB.query('homeDashboa', where:'cart=?', whereArgs: [1])).map((e) => homeModel.fromjson(e)).toList();
  }

  Future<double> fetchTotalPriceForCart() async {
    final result = await myObjectDB.query(
      'homeDashboa',
      columns: ['prices'],
      where: 'cart = ?',
      whereArgs: [1],
    );

    double totalPrice = 0.0;
    for (final row in result) {
      final priceString = row['prices'] as String;
      final priceValue = double.parse(priceString.replaceAll(r'$', ''));
      totalPrice += priceValue;
    }
    return totalPrice;
  }


  Future<void> insertHomeProduct(String tabs, String image, String productTitle, String price,
      int review, int quantity, int availableQuantity) async {
    await myObjectDB.insert('homeDashboa', {
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
    myObjectDB.update('homeDashboa', {
      'availableQuantity':qnt,
    }, where: 'id=?', whereArgs: [id]);
  }

  void updateFavorite(int id, int value){
    myObjectDB.update('homeDashboa', {
      'favorite': value,
    }, where: 'id = ?', whereArgs: [id]);
  }
  void updateCart(int value, int id){
    myObjectDB.update('homeDashboa', {
      'cart':value,
    }, where: 'id=?', whereArgs: [id]);
  }

  Future<void> deleteProduct({int id = 1})async {
    myObjectDB.delete('homeDashboa', where: 'id=?', whereArgs: [id]);
  }


}