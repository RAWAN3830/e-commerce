import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constant/string.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApplyCoupon {
  final fireStore = FirebaseFirestore.instance;

  Future<void> placeOrder() async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) return;

    final couponRef = fireStore.collection(FirestoreCollections.coupon).doc(
        currentUserId);

    final currentProduct = await couponRef.get();
    List<dynamic> orderProductList = currentProduct.data()?['order'] ?? [];
  }
}