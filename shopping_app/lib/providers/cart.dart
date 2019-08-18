import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(this.id, this.title, this.price, this.quantity);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> productCartItems = {};

  Map<String, CartItem> get getProductCartItems {
    return {...productCartItems};
  }

  int get itemCount  {
    return productCartItems.length;
  }

  void removeItem(String productId){
    productCartItems.remove(productId);
    notifyListeners();
  }

  double get totalCount  {
    var total = 0.0;
    productCartItems.forEach((key, cartItem){
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear(){
    productCartItems = {};
    notifyListeners();
  }

  void removeSingleItem(String pid){
    if(!productCartItems.containsKey(pid)){
      return;
    }

    if(productCartItems[pid].quantity > 1){
      productCartItems.update(pid, (item)=> CartItem(item.id, item.title, item.price  , item.quantity-1, ));
    } else{
      productCartItems.remove(pid);
    }
    notifyListeners();
  }

  void addItem(String productId, String title, double price) {
    if (productCartItems.containsKey(productId)) {
      productCartItems.update(productId, (existingCartItem) => (CartItem(
        existingCartItem.id,
        existingCartItem.title,
        existingCartItem.price,
        existingCartItem.quantity + 1,
      )));
    } else {
      productCartItems.putIfAbsent(
          productId,
          () => (CartItem(
                DateTime.now().toString(),
                title,
                price,
                1,
              )));
    }
    notifyListeners();
  }
}
