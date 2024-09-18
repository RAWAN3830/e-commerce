import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/model_class.dart';
import '../../constant/string.dart';

class addProductToCart {
  static Future<dynamic> addToCart(ProductModel product) async {
    final fireStore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);

    final currentProducts = await cartRef.get();
    List<dynamic> currentProductList =
        currentProducts.data()?['products'] ?? [];


//-------  add  first item -----------------
    if(currentProductList.isEmpty) {
      currentProductList.add(product.toJson());
      final productData = {'products': currentProductList};
      await cartRef.update(productData);
      return ;
    }

// ------- add existing product in cart (increase Quantity)-----------------
    for(var element in currentProductList){
      if(element['id'] == product.id){
        element['quantity']++;
        final productData = {'products': currentProductList};

        await cartRef.update(productData);
        return;
      }

    }
// ------- add new product in cart -----------------
    currentProductList.add(product.toJson());
    final productData = {'products': currentProductList};

    await cartRef.update(productData);
  }
  
  static Future<void> deleteProductFromCart(String productId) async{
    final fireStore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;
    
    final cartRef = fireStore.collection(FirestoreCollections.cart).doc(userId);

    final currentProducts = await cartRef.get();
    List<dynamic> currentProductList = currentProducts.data() ?['products'] ?? [];

    //-------  Remove first item -----------------
    final productList = currentProductList.map((e) => ProductModel.fromJson(e)).toList();
    productList.removeWhere((element) {
      return (element.id ==productId);});

    // ------- remove existing product in cart (decrease Quantity)-----------------
    for(var element in currentProductList){
      if(element['id'] == productId){
        element['quantity']--;
        final productData = {
          'products': productList.map((e) => e.toJson()).toList(),
        };
        await cartRef.update(productData);
        return;
      }

    }
    final productData = {
      'products': productList.map((e) => e.toJson()).toList(),
    };
    await cartRef.update(productData);

  }
}

