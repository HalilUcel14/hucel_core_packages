import 'package:flutter/material.dart';
import 'package:hucel_core/src/extension/context_extension.dart';

class SpaceSizedHeightBox extends SizedBox {
  const SpaceSizedHeightBox(
      {Key? key, required BuildContext context, required double height})
      : super(key: key, height: height);
}

class SpaceSizedWidhtBox extends SizedBox {
  const SpaceSizedWidhtBox(
      {Key? key, required BuildContext context, required double width})
      : super(key: key, width: width);
}
