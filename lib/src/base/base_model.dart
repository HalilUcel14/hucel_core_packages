import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel<T> {
  Map<String, Object?> toJson();
  T fromJson(Map<String, Object> json);
  T fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> docs);
}

//for Example
// class Note extends BaseModel {
//   String? uuid;
//   String? title;
//   String? content;
//   String? createDate;
//   int? colorId;

//   Note({this.uuid, this.colorId, this.content, this.createDate, this.title});

//   Note.notUuid(
//       {this.uuid = "",
//       this.colorId,
//       this.content,
//       this.createDate,
//       this.title});

//   static const String fireUuid = 'note_uuid';
//   static const String fireNoteTitle = 'note_title';
//   static const String fireColorId = 'color_id';
//   static const String fireCreatingDate = 'creating_date';
//   static const String fireNoteContent = 'note_content';

//   @override
//   fromJson(Map<String, Object> json) {
//     return Note(
//       uuid: json[fireUuid].toString(),
//       title: json[fireNoteTitle].toString(),
//       colorId: int.parse(json[fireColorId].toString()),
//       content: json[fireNoteContent].toString(),
//       createDate: json[fireCreatingDate].toString(),
//     );
//   }

//   @override
//   Map<String, Object?> toJson() {
//     return {
//       fireUuid: uuid,
//       fireNoteTitle: title,
//     };
//   }

//   fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> docs) {
//     return Note(
//       uuid: docs.id,
//       colorId: docs.data()![Note.fireColorId],
//       content: docs.data()![Note.fireNoteContent],
//       createDate: docs.data()![Note.fireCreatingDate],
//       title: docs.data()![Note.fireNoteTitle],
//     );
//   }
// }

// //List<Note> streamNote = [];
// Firebase den gelen veriyi bir listeye almak.
// Future<dynamic> noteListFirestore() async {
//   QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//       .instance
//       .collection(AppString.noteColleciton)
//       .get();
//   // return snapshot.docs
//   //     .map((notes) => Note().fromDocumentSnapshot(docs))
//   //     .toList();
//   return snapshot.docs
//       .map((docSnapshot) => Note().fromDocumentSnapshot(docSnapshot))
//       .toList();
// }