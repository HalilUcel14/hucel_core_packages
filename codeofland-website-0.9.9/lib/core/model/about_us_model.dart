import 'package:hucel_core/hucel_core.dart';

class AboutUsModel implements BaseModel {
  String? displayName;
  String? imageUrl;
  String? title;

  AboutUsModel({this.displayName, this.imageUrl, this.title});

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
