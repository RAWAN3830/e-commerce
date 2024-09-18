import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/cart_services/add_to_cart_function.dart';
import 'package:e_commerce/domain/categorie_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/model_class.dart';
import '../constant/string.dart';
import '../services/api_service/categorie_api.dart';
import '../services/api_service/product_api.dart';
import '../services/api_service/product_by_category_api.dart';

class ApiProvider with ChangeNotifier {

  bool isLoading = false;
  bool isTheme = false;
  void setLoading(bool val)
  {
    isLoading = val;
  }
  List<ProductModel> productList = [];
  List<ProductModel> productByCategory = [];
  List<CategorieModel> categoryList = [];

//--------------- PROVIDER OF API WHO CALLING PRODUCT  ------------------------------

  Future<dynamic> ProviderProductData() async {
    setLoading(true);
    productList = await ProductApiCall().loadApiData();
    print(productList);
    setLoading(false);
    notifyListeners();
  }

//--------------- PROVIDER OF API WHO PROVIDE CATEGORY ------------------------------

  Future<void> providerCategory() async {
    setLoading(true);
    categoryList = await CategorieApi.fetchCategories();
    print(categoryList);
    setLoading(false);
    notifyListeners();
  }

// --------------- PROVIDER OF API WHO CALLING PRODUCT BY CATEGORY ------------------------------
  Future<void> providerProductByCategory({required String id}) async {
    setLoading(true);
    productByCategory = await ProductByCategoryApi.productByCategory(id: id);
    print(productByCategory);
    setLoading(false);
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
  Future<void> deleteFromCart(String productId) async{
    setLoading(true);
    await addProductToCart.deleteProductFromCart(productId);
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
