import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/model_class.dart';
import '../../constant/string.dart';

class DeleteInCart{

  static Future<void> deleteProductFromCart(String productId) async{
    final fireStore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);

    final currentProducts = await cartRef.get();
    List<dynamic> currentProductList = currentProducts.data() ?['products'] ?? [];

    //-------  Remove first item -----------------
    final productList = currentProductList.map((e) => ProductModel.fromJson(e)).toList();
    productList.removeWhere((element)
    {
      return (element.id ==productId);
    }
    );
    // ------- remove existing product in cart (decrease Quantity)-----------------
    final productData = {
      'products': productList.map((e) => e.toJson()).toList(),
    };
    await cartRef.update(productData);

  }


  static Future<void> decreaseQnt(String productId) async {
    final fireStore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);

    final currentProducts = await cartRef.get();
    List<dynamic> currentProductList = currentProducts.data()?['products'] ?? [];

    // Convert the product data to a list of ProductModel objects
    final productList = currentProductList.map((e) => ProductModel.fromJson(e)).toList();

    // Find the product in the cart by ID
    for (var element in productList)
    {
      if (element.id == productId) {
        element.quantity != null
            ? (element.quantity! > 1
            ? element.quantity = element.quantity! - 1 // Decrease quantity if more than 1
            : productList.removeWhere((item) => item.id == productId)) // Remove the product if quantity is 1
            : null;

        // Update the cart with the new product list
        final productData = {
          'products': productList.map((e) => e.toJson()).toList(),
        };
        await cartRef.update(productData);
        return;
      }
      // if (element.id == productId) {
      //   if (element.quantity != null) {
      //     if (element.quantity! > 1) {
      //       // Decrease quantity if more than 1
      //       element.quantity = element.quantity! - 1;
      //     }
      //     else {
      //       // Remove the product if quantity is 1
      //       productList.removeWhere((item) => item.id == productId);
      //     }
      //   }
      //
      //   // Update the cart with the new product list
      //   final productData = {
      //     'products': productList.map((e) => e.toJson()).toList(),
      //   };
      //   await cartRef.update(productData);
      //   return;
      // }
    }
  }


}