class FileConstants {
  static FileConstants? _instance;
  static FileConstants get instance {
    _instance ??= FileConstants._init();
    return _instance!;
  }

  FileConstants._init();

  final imageType = "image/";
  final videoType = "video/";
  final audioType = "audio/";
  final textType = "text/";
}
