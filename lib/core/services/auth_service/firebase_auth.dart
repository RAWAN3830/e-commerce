import 'package:e_commerce/core/constant/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Signup screen: email, password --> Provider (email, password) --> AuthService(email, password)

class AuthService {
  static final _fireStore = FirebaseFirestore.instance;

  //-----------------------------------  FIREBASE AUTH FOR REGISTRATION --------------------------------------------------

  static Future<UserCredential> createUser(
      {required String email, required String password}) async {
    final firebase = FirebaseAuth.instance;
    final userCredentials = await firebase.createUserWithEmailAndPassword(
        email: email, password: password);

    final userData = {
      'email': userCredentials.user?.email,
      'password': password,
      'uid': userCredentials.user?.uid
    };

    await _fireStore
        .collection(FirestoreCollections.users)
        .doc(userCredentials.user?.uid)
        .set(userData);
    await _fireStore
        .collection(FirestoreCollections.cart)
        .doc(userCredentials.user?.uid)
        .set({});

    return userCredentials;
  }

  //-----------------------------------  FIREBASE AUTH FOR LOG-IN --------------------------------------------------

  static Future<UserCredential> loginUser(
      {required String email, required String password}) async {
    final firebase = FirebaseAuth.instance;
    final userCredential = await firebase.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential;
  }
}
