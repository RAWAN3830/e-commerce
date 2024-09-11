import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/domain/categorie_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/model_class.dart';
import '../constant/string.dart';
import '../services/api_service/categorie_api.dart';
import '../services/api_service/product_api.dart';
import '../services/api_service/product_by_category_api.dart';

class ApiProvider with ChangeNotifier {
  final isLoadingProduct = true;
  List<ProductModel> productList = [];
  List<ProductModel> productByCategory = [];
  List<CategorieModel> categoryList = [];

//--------------- PROVIDER OF API WHO CALLING PRODUCT  ------------------------------

  Future<dynamic> ProviderProductData() async {
    productList = await ProductApiCall().loadApiData();
    print(productList);
    notifyListeners();
  }

//--------------- PROVIDER OF API WHO PROVIDE CATEGORY ------------------------------

  Future<void> providerCategory() async {
    categoryList = await ApiOfCategorie.fetchCategories();
    print(categoryList);
    notifyListeners();
  }

// --------------- PROVIDER OF API WHO CALLING PRODUCT BY CATEGORY ------------------------------
  Future<void> providerProductByCategory({required String id}) async {
    productByCategory = await ProductByCategoryApi.productByCategory(id: id);
    print(productByCategory);
    notifyListeners();
  }

   Future<dynamic> addProductToCart(ProductModel product) async {
    final _fireStore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final userRef =
        _fireStore.collection(FirestoreCollections.users).id; // return 'users'
    await _fireStore
        .collection(FirestoreCollections.cart)
        .doc(userRef)
        .set(product.toJson()); // add product using productmodel in 'cart'
    notifyListeners();
  }
}
