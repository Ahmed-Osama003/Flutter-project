
class homeModel{

  String? tabs, image, productTitle, price;
  int? id, review, quantity, availableQuantity, favorite, cart;
  homeModel.fromjson(Map m){
    tabs = m['tabs'];
    image = m['image'];
    productTitle = m['productTitles'];
    id = m['id'];
    price = m['prices'];
    review = m['reviews'];
    quantity = m['quantity'];
    availableQuantity = m['availableQuantity'];
    favorite = m['favorite'];
    cart = m['cart'];
  }




}