class PackageInfoNotFound implements Exception {
  final String _description =
      'Please call the await DeviceUtility.instance.initPackageInfo()';
  PackageInfoNotFound();

  @override
  String toString() {
    return _description;
  }
}
