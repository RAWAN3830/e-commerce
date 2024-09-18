import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/model_class.dart';
import '../../constant/string.dart';

class addProductToCart{
static Future<dynamic> addToCart(ProductModel product) async {
  final fireStore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);

   final currentProducts = await cartRef.get();
   List<dynamic> currentProductList = currentProducts.data()?['products'] ?? [];
   currentProductList.add(product.toJson());

  final productData = {
    'products': currentProductList
  };

  await cartRef.update(productData);
}


}