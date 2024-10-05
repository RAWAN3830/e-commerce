import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constant/string.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/orderdetail.dart';

class OrderProductData {
  final fireStore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final List<OrderDetails> orderProductList = [];

  // ============== Place Order and add order-details in Firebase ==============
 Future<void> placeOrder({required OrderDetails orderDetails}) async{
   final currentUserId = FirebaseAuth.instance.currentUser?.uid;
   if(currentUserId == null) return;
   final orderRef = fireStore.collection(FirestoreCollections.order).doc(currentUserId);

   final currentProduct = await orderRef.get();
   List<dynamic> orderProductList = currentProduct.data()?['order']??[];
   if(orderProductList.isEmpty){
     orderProductList.add(orderDetails.toJson());
     final productData = {'order': orderProductList};
     await orderRef.update(productData);
     return;
   }

   orderProductList.add(orderDetails.toJson());
   final productData = {'order': orderProductList};
   await orderRef.update(productData);
 }
  // ============== Clear Basket ==============
 Future<void> clearBasket() async{
   final currentUserId = FirebaseAuth.instance.currentUser?.uid;
   if(currentUserId == null) return;
   final productData = {
     'products': [],
   };

   await fireStore.collection(FirestoreCollections.cart).doc(currentUserId).update(productData);
 }

 // ============== all Order add in list and print list ==============
 Future<List<OrderDetails>> getOrderDetails() async {
   final orderRef = await fireStore.collection(FirestoreCollections.order).doc(userId).get();
   final productList = await orderRef.data()?['order'];
   for(var product in productList){
     orderProductList.add(OrderDetails.fromJson(product));
   }
   return orderProductList;

 }
}
