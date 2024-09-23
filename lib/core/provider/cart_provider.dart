
import 'package:e_commerce/core/services/cart_services/add_to_cart_function.dart';
import 'package:e_commerce/core/services/cart_services/delete_in_cart.dart';
import 'package:e_commerce/core/services/cart_services/recive_to_cart.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model_class.dart';


class CartProvider extends ChangeNotifier{
  bool isTheme = false;
  bool isLoading = false;



  void setLoading(bool val){
    isLoading = val;
  }

  List<ProductModel> cartData = [];
  Future<dynamic> getDataFromCart() async{
    cartData = await ReciveToCart().getCartProducts();
    notifyListeners();
  }

  // --------------- PROVIDER OF ADD PRODUCT TO CART ------------------------------
  Future<void> addToCart(ProductModel product) async{
    setLoading(true);
    await addProductToCart.addToCart(product);
    setLoading(false);
    notifyListeners();
  }

  // --------------- PROVIDER OF DELETE PRODUCT FROM CART ------------------------------
  Future<void> removeFromCart(String productId) async{
    setLoading(true);
    await DeleteInCart.decreaseQnt(productId);
    setLoading(false);
    notifyListeners();
  }

  Future<void> deleteFromCart(String productId) async{
    setLoading(true);
    await DeleteInCart.deleteProductFromCart(productId);
    setLoading(false);
    notifyListeners();
  }


  set setTheme(value) {
    isTheme = value;
    notifyListeners();
  }

  get getTheme {
    return isTheme;
  }



}


