
import 'package:flutter/cupertino.dart';
import '../../domain/model_class.dart';
import '../services/cart_services/add_to_cart_function.dart';
import '../services/cart_services/delete_in_cart.dart';
import '../services/cart_services/recive_to_cart.dart';


class CartProvider extends ChangeNotifier{
  bool isTheme = false;
  bool isLoading = false;
  double totalCartValue = 0;
  double total = 0;

  void setLoading(bool val){
    isLoading = val;
  }

  List<ProductModel> cartData = [];
  Future<dynamic> getDataFromCart() async{
    cartData = await ReciveToCart().getCartProducts();
    totalOfItem();
    notifyListeners();
  }

  // --------------- PROVIDER OF ADD PRODUCT TO CART ------------------------------
  Future<void> addToCart(ProductModel product) async{
    setLoading(true);
    await addProductToCart.addToCart(product);
    setLoading(false);
    totalOfItem();
    notifyListeners();
  }

  // --------------- PROVIDER OF DELETE PRODUCT FROM CART ------------------------------
  Future<void> removeFromCart(String productId) async{
    setLoading(true);
    await DeleteInCart.decreaseQnt(productId);
    setLoading(false);
    totalOfItem();
    notifyListeners();
  }

  Future<void> deleteFromCart(String productId) async{
    setLoading(true);
    await DeleteInCart.deleteProductFromCart(productId);
    setLoading(false);
    totalOfItem();
    notifyListeners();
  }

  void totalOfItem()  {
    totalCartValue = 0;
    for (var element in cartData) {
      double productVal = double.parse(element.quantity.toString()) * double.parse(element.price.toString());
      totalCartValue = totalCartValue + productVal;
    }
  }

  set setTheme(value) {
    isTheme = value;
    notifyListeners();
  }

  get getTheme {
    return isTheme;
  }



}

