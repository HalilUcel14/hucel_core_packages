import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/widget/project/custom_page_container.dart';

class ThirdRegion extends StatelessWidget {
  const ThirdRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageContainer.blue(
      context,
      child: context.width > context.mediumScreenSize
          ? _rowChild(context)
          : _columnChild(context),
    );
  }

  Widget _columnChild(BuildContext context) {
    return SizedBox(
      width: context.mediumScreenSize,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              height: 500,
              width: context.smallScreenSize,
              color: Colors.red,
              constraints: BoxConstraints(maxHeight: context.mediumScreenSize),
            ),
            const SizedBox(width: 20),
            Container(
              height: 500,
              width: context.smallScreenSize,
              color: Colors.red,
              constraints: BoxConstraints(maxHeight: context.mediumScreenSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowChild(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Container(
            color: Colors.black38,
            width: constraints.maxWidth * 0.4,
            child: const Placeholder(),
          ),
          const Spacer(),
          Container(
            width: constraints.maxWidth * 0.4,
            decoration: const BoxDecoration(color: Colors.black45),
            child: const AspectRatio(aspectRatio: 1 / 2),
          ),
        ],
      );
    });
  }
}
