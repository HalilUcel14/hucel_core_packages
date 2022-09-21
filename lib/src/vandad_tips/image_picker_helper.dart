import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

@immutable
class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();
  static Future<File> pickImageFromGallery() => _imagePicker
      .pickImage(source: ImageSource.gallery)
      .unwrap()
      .then((xFile) => xFile.path)
      .then((filePath) => File(filePath));
}
