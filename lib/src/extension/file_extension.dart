import 'dart:io';

import 'package:mime/mime.dart' show lookupMimeType;

import '../constants/file_constants.dart';

enum FileType { image, video, audio, text, unknown }

extension FileTypeExtension on File {
  FileType get fileType {
    final mimeType = lookupMimeType(path);
    if (mimeType?.startsWith(FileConstants.instance.imageType) ?? false) {
      return FileType.image;
    }
    if (mimeType?.startsWith(FileConstants.instance.videoType) ?? false) {
      return FileType.video;
    }
    if (mimeType?.startsWith(FileConstants.instance.audioType) ?? false) {
      return FileType.audio;
    }
    if (mimeType?.startsWith(FileConstants.instance.textType) ?? false) {
      return FileType.text;
    }
    return FileType.unknown;
  }

  bool get isImageFile => fileType == FileType.image ? true : false;
  bool get isVideoFile => fileType == FileType.video ? true : false;
  bool get isAudioFile => fileType == FileType.audio ? true : false;
  bool get isTextFile => fileType == FileType.text ? true : false;
}
