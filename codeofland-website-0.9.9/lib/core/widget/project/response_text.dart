import 'package:flutter/material.dart';

class DefaultTextType extends StatelessWidget {
  const DefaultTextType({
    super.key,
    required this.text,
    this.textKey,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    //
    this.fractionalKey,
    this.widthFactor,
    this.heightFactor,
    this.alignment = Alignment.center,
    this.textCenter = false,
  });

  final bool textCenter;
  final String text;
  final Key? textKey;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  //
  final Key? fractionalKey;
  final AlignmentGeometry alignment;
  final double? widthFactor;
  final double? heightFactor;
  //
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: alignment,
      heightFactor: heightFactor,
      key: fractionalKey,
      widthFactor: widthFactor,
      child: textCenter ? Center(child: newMethod()) : newMethod(),
    );
  }

  Widget newMethod() {
    return Text(
      text,
      key: textKey,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
