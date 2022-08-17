import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../../interface/i_file_manager.dart';
import '../../../models/local_file_model.dart';

part 'file.dart';

class LocaleFile extends IFileManager {
  final _FileManager _fileManager = _FileManager.instance;

  @override
  Future<String?> getUserRequestDataOnString(String key) {
    return _fileManager.readOnlyKeyData(key);
  }

  @override
  Future<bool> removeUserRequestCache(String key) async {
    await _fileManager.clearAllDirectoryItems();
    return true;
  }

  @override
  Future<bool> removeUserRequestSingleCache(String key) async {
    await _fileManager.removeSingleItem(key);
    return true;
  }

  @override
  Future<bool> writeUserRequestDataWithTime(
      String key, String model, Duration? time) async {
    if (time == null) {
      return false;
    } else {
      final _localeModel =
          LocaleModel(model: model, time: DateTime.now().add(time));
      await _fileManager.writeLocalModelInFile(key, _localeModel);
      return true;
    }
  }
}
