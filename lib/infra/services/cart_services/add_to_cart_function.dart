import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/model_class.dart';
import '../../constant/string.dart';

 class addProductToCart {
//   static Future<dynamic> addToCart(ProductModel product) async {
//     final fireStore = FirebaseFirestore.instance;
//     final userId = FirebaseAuth.instance.currentUser?.uid;
//
//     final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);
//
//     final currentProducts = await cartRef.get();
//     List<dynamic> currentProductList =
//         currentProducts.data()?['products'] ?? [];
//
//
// //-------  add  first item -----------------
//     if(currentProductList.isEmpty) {
//       currentProductList.add(product.toJson());
//       final productData = {'products': currentProductList};
//       await cartRef.update(productData);
//       return ;
//     }
//
// // ------- add existing product in cart (increase Quantity)-----------------
//     for(var element in currentProductList){
//       if(element['id'] == product.id){
//         element['quantity']++;
//         final productData = {'products': currentProductList};
//
//         await cartRef.update(productData);
//         return;
//       }
//
//     }
// // ------- add new product in cart -----------------
//     currentProductList.add(product.toJson());
//     final productData = {'products': currentProductList};
//
//     await cartRef.update(productData);
//   }
//
//

   static Future<void> addToCart(ProductModel product) async {
     final fireStore = FirebaseFirestore.instance;
     final userId = FirebaseAuth.instance.currentUser?.uid;

     final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);

// Get the current products in the user's cart
     final currentProducts = await cartRef.get();
     List<dynamic> currentProductList = currentProducts.data()?['products'] ?? [];

// Find the product in the cart and increase the quantity
     for (var element in currentProductList) {
       if (element['id'] == product.id) {
         element['quantity']++;
         final productData = {'products': currentProductList};

// Update the cart with the new quantity
         await cartRef.update(productData);
         return;
       }
     }

// If the product is not found in the cart, add it (or handle this scenario as needed)
     currentProductList.add(product.toJson());
     final productData = {'products': currentProductList};
     await cartRef.update(productData);
   }

 }


