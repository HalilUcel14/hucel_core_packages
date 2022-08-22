import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/firebase-batch-operations-in-flutter/firebase-batch-operations-in-flutter.dart

Future<bool> deleteAccountAndDocuments() async {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  if (user == null) {
    return false;
  }
  final userId = user.uid;
  // delete user documents
  try {
    final store = FirebaseFirestore.instance;
    final operation = store.batch();
    final collection = await store.collection(userId).get();
    for (final document in collection.docs) {
      operation.delete(document.reference);
    }
    await operation.commit();
    // delete the user
    await user.delete();
    // log the user out
    await auth.signOut();
    return true;
  } catch (_) {
    return false;
  }
}
