import 'package:firebase_auth/firebase_auth.dart';

import '../../hucel_core.dart';

class FirebaseUserModel implements FireBaseModel {
  //
  @override
  String? uuid;
  String? displayName;
  String? email;
  bool? emailVerified;
  bool? isAnonymoous;
  String? phoneNumber;
  String? photoUrl;
  bool? isOnline;
  

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
