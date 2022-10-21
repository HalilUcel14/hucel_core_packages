import 'package:hucel_core/hucel_core.dart';

class MainPageModel extends BaseModel {
  String? title;
  String? subTitle;
  String? mainUrl;
  List<String>? appBarTitle;
  //
  //BlogModel lastBlog;
  //CodeArchiveModel archiveModel;
  //ProjectModel allProject;
  //ProfileModel profile;
  //ContactModel contact;

  //
  MainPageModel({
    this.mainUrl,
    this.subTitle,
    this.title,
    this.appBarTitle,
  });

  ///
  @override
  fromJson(Map<String, dynamic> json) {
    return MainPageModel(
      mainUrl: json['mainUrl'],
      subTitle: json['subTitle'],
      title: json['title'],
      appBarTitle: json['appBarTitle'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'mainUrl': mainUrl,
      'subTitle': subTitle,
      'title': title,
      'appBarTitle': appBarTitle,
    };
  }
}
