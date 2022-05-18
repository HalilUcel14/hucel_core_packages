import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDocumentHelper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //
  addData(
      {required String collectionName,
      required Map<String, dynamic> data}) async {
    try {
      await _db.collection(collectionName).add(data);
    } catch (e) {
      throw e.toString();
    }
  }

  updateData(
      {required String collectionName,
      String? documentId,
      required Map<String, dynamic> data}) async {
    try {
      await _db.collection(collectionName).doc(documentId).update(data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteData(
      {required String collectionName, required String documentId}) async {
    try {
      await _db.collection(collectionName).doc(documentId).delete();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataDocs(
      {required String collectionName}) async {
    //
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _db.collection(collectionName).get();
      return snapshot.docs;
    } catch (e) {
      throw e.toString();
    }
  }
}
