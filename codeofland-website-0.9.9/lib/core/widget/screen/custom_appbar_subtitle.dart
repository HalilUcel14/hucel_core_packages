import 'package:flutter/material.dart';

import '../../constants/screen_constant.dart';

class CustomAppBarSubTitle extends StatelessWidget {
  const CustomAppBarSubTitle(
      {Key? key,
      required this.title,
      this.style,
      this.isFitted = true,
      this.align = TextAlign.center})
      : super(key: key);
  final TextAlign? align;
  final String title;
  final TextStyle? style;
  final bool isFitted;

  @override
  Widget build(BuildContext context) {
    if (isFitted) {
      return FittedBox(
        child: Text(
          title,
          textAlign: align,
          style: style ?? HomeConstants.instance.appSubtitleStyle,
        ),
      );
    } else {
      return Text(
        title,
        textAlign: align,
        style: style ?? HomeConstants.instance.appSubtitleStyle,
      );
    }
  }
}
