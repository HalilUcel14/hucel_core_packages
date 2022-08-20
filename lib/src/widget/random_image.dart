import 'package:flutter/material.dart';
import 'package:hucel_core/src/extension/string_extension.dart';

class RandomImageContainer extends Container {
  RandomImageContainer({
    Key? key,
    required BuildContext context,
    double? height,
  }) : super(
            key: key,
            child: Image.network(
              "".randomImage,
              fit: BoxFit.cover,
              height: height ?? 200,
            ));
}
