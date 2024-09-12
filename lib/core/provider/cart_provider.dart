import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constant/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model_class.dart';

class CartProvider extends ChangeNotifier{
  List<ProductModel> cartProducts = [];
  bool isLoading = false;

  void setLoading(bool val){
    isLoading = val;
  }

  Future<void> getCartProducts() async{
    setLoading(true);
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    cartProducts = [];
    final data = await firestore.collection(FirestoreCollections.cart).doc(uid).get();
    final productList = await data.data()?['products'];
    for(var product in productList){
      cartProducts.add(ProductModel.fromJson(product));
    }
    setLoading(false);
    notifyListeners();
  }
}