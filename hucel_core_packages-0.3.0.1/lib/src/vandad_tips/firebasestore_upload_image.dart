

// Future<bool> uploadImage({
//   required File file,
//   required String userId,
// }) =>
//     FirebaseStorage.instance
//         .ref(userId)
//         .child(const Uuid().v4())
//         .putFile(file)
//         .then((_) => true)
//         .catchError((_) => false);