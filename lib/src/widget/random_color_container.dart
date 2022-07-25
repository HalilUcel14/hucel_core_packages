import 'package:flutter/material.dart';
import 'package:hucel_core/src/extension/context_extension.dart';

class RandomColorContainer extends Container {
  RandomColorContainer({
    Key? key,
    required BuildContext context,
  }) : super(
          key: key,
          color: context.randomColor,
        );
}
