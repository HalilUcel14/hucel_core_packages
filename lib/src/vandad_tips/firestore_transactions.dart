import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteAllDocumentFirestore({
  required String postId,
  required String collections,
}) {
  return FirebaseFirestore.instance.runTransaction(
    maxAttempts: 3,
    timeout: const Duration(seconds: 20),
    (transaction) async {
      final query = await FirebaseFirestore.instance
          .collection(collections)
          .where(
            'post_id',
            isEqualTo: postId,
          )
          .get();
      for (final object in query.docs) {
        transaction.delete(object.reference);
      }
    },
  );
}
