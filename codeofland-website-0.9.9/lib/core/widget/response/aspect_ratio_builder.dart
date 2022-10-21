import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class AspectRatioBuilder extends AspectRatio {
  AspectRatioBuilder({
    Key? key,
    required AspectRatioType type,
    EdgeInsetsGeometry? padding,
    required Widget Function(BuildContext context, BoxConstraints constraints)
        builder,
  }) : super(
          key: key,
          aspectRatio: type.size,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: LayoutBuilder(
              builder: builder,
            ),
          ),
        );
}
