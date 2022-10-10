import 'package:flutter/material.dart';

class ColumnWithSpacing extends Column {
  ColumnWithSpacing({
    super.key,
    double spacing = 8,
    bool hasLeadingSpace = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    List<Widget> children = const [],
  }) : super(children: [
          ...hasLeadingSpace
              ? [
                  SizedBox(
                    height: spacing,
                  )
                ]
              : <Widget>[],
          ...children.expand((element) => [
                element,
                SizedBox(
                  height: spacing,
                )
              ]),
        ]);
}
