import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthService {
  late final FirebaseAuth auth;

  Stream<User?> get authStateChange;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<void> signInAnonymously();
}


/// # -- [firebase add] -- #
/// firebase_core: ^1.14.1
/// firebase_auth: ^3.3.14
/// cloud_firestore: ^3.1.12
/// firebase_storage: ^10.2.12
/// 
/// # -- social account -- #
/// google_sign_in: ^5.3.0
/// flutter_facebook_auth: ^4.2.1
/// twitter_login: ^4.2.2