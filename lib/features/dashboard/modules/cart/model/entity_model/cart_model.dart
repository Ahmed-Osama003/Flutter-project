class cartModel{

  String? tabs, image, productTitle;
  int? id, price, review, quantity, availableQuantity, favorite, cart;
  cartModel.fromjson(Map m){
    tabs = m['tabs'];
    image = m['image'];
    productTitle = m['productTitles'];
    id = m['id'];
    price = m['prices'];
    quantity = m['quantity'];
    availableQuantity = m['availableQuantity'];
    cart = m['cart'];
  }




}