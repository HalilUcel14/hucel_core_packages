enum AssetLottieEnum {
  splash,
  ;

  String get string => toString().split('.').last;

  String get path => 'assets/lottie/$string.json';
}
