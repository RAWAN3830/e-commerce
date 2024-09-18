import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/model_class.dart';
import '../../constant/string.dart';

class ReciveToCart{
  List<ProductModel> cartProducts = [];

Future<List<ProductModel>> getCartProducts() async {
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;
  cartProducts = [];
  final data = await firestore.collection(FirestoreCollections.cart).doc(uid).get();
  final productList = await data.data()?['products'];
  for (var product in productList) {
    cartProducts.add(ProductModel.fromJson(product));
  }
  return cartProducts;
}
  }