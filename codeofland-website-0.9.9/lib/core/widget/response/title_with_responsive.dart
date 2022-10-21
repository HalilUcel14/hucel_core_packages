import 'package:flutter/cupertino.dart';

class FlexibleText extends Flexible {
  FlexibleText(
    String data, {
    Key? key,
    FlexFit fit = FlexFit.loose,
    int flex = 1,
    //
    Key? textKey,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) : super(
          key: key,
          child: Text(
            data,
            key: textKey,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            semanticsLabel: semanticsLabel,
            softWrap: softWrap,
            strutStyle: strutStyle,
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
            textHeightBehavior: textHeightBehavior,
            textScaleFactor: textScaleFactor,
            textWidthBasis: textWidthBasis,
          ),
          fit: fit,
          flex: flex,
        );
}
