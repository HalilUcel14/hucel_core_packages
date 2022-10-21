import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  static const double _defaultValue = 16;

  const PagePadding.onlyTop({double size = _defaultValue})
      : super.only(top: size);
  const PagePadding.onlyBottom({double size = _defaultValue})
      : super.only(bottom: size);
  const PagePadding.onlyLeft({double size = _defaultValue})
      : super.only(left: size);
  const PagePadding.onlyRight({double size = _defaultValue})
      : super.only(right: size);

  const PagePadding.horizontal({double size = _defaultValue})
      : super.symmetric(horizontal: _defaultValue);
  const PagePadding.vertical({double size = _defaultValue})
      : super.symmetric(vertical: size);

  const PagePadding.all({double size = _defaultValue}) : super.all(size);
  const PagePadding.notBottom({double size = _defaultValue})
      : super.only(top: size, left: size, right: size);
}
