import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class WeLastProjects extends StatelessWidget {
  const WeLastProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatioContainer(
      type: AspectRatioType.type2x3,
      padding: context.padHorizontalS,
      decoration: const BoxDecoration(color: Colors.white),
      child: ResponsiveChild(
        small: _child,
      ),
    );
  }

  Widget get _child {
    return MultiBuilder(builder:
        (context, deviceHeight, deviceWidth, boxConstraints, orientation) {
      return Container(
        padding: context.padHorizontalL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBoxText(
              'We All ${boxConstraints.maxHeight} - ${boxConstraints.maxWidth}',
              style: context.headline4?.coBoldBlack,
            ),
            FittedBoxText(
              'Projects'.leftTabSpace,
              style: context.headline4?.coBoldBlack,
            ),
          ],
        ),
      );
    });
  }
}
