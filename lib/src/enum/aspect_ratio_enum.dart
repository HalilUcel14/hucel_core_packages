enum AspectRatioType {
  type9x16,
  type16x9,
  type21x9,
  type9x21,
  type4x3,
  type1x1,
  type3x2,
  type2x3,
  type3x4;

  double get size {
    switch (this) {
      case AspectRatioType.type9x16:
        return 9 / 16;
      case AspectRatioType.type16x9:
        return 16 / 9;
      case AspectRatioType.type2x3:
        return 2 / 3;
      case AspectRatioType.type3x2:
        return 3 / 2;
      case AspectRatioType.type3x4:
        return 3 / 4;
      case AspectRatioType.type4x3:
        return 4 / 3;
      case AspectRatioType.type21x9:
        return 21 / 9;
      case AspectRatioType.type9x21:
        return 9 / 21;
      case AspectRatioType.type1x1:
        return 1;
      default:
        return 1;
    }
  }
}
