import 'package:flutter/material.dart';

typedef MultiSizer = Widget Function(BuildContext context, double deviceHeight,
    double deviceWidth, BoxConstraints boxConstraints, Orientation orientation);

class MultiBuilder extends StatelessWidget {
  const MultiBuilder({
    Key? key,
    required this.builder,
    // ignore: unnecessary_null_comparison
  })  : assert(builder != null),
        super(key: key);

  final MultiSizer builder;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        return builder(
            context, size.height, size.width, constraints, orientation);
      });
    });
  }
}
