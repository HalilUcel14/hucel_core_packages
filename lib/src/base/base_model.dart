abstract class BaseModel<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}

abstract class FireBaseModel<T> {
  String? uuid;
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
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

//   
// }

