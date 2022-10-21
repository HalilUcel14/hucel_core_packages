import 'package:codeofland_website/core/widget/screen/default_region_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/constants/kDefault_constants.dart';
import '../../../core/constants/localization_const.dart';
import '../../../core/constants/screen_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/style_extension.dart';
import '../../../core/widget/custom_elevated_button.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: context.padHorizontalS,
        decoration: HomeConstants.instance.customAppBarDecoration,
        width: context.dynamicWidth(0.95),
        height: KDefaultConst.appBarSize,
        child: _barChild(context),
      ),
    );
  }

  ///
  ///
  ///

  Widget _barChild(BuildContext context) {
    return Row(
      children: [
        codeOfLandText(context),
        const Spacer(),
        if (!context.isScreenLow) barList(context),
        contactButton(context),
      ],
    );
  }

  // CODE OF LAND
  Widget codeOfLandText(BuildContext context) {
    return FittedBox(
      child: RichText(
        overflow: TextOverflow.fade,
        maxLines: 1,
        text: TextSpan(
          style: context.appBarStyle.coBold,
          spellOut: true,
          children: [
            TextSpan(text: LocalizationConst.codeOfLand[0]),
            TextSpan(
              text: LocalizationConst.codeOfLand[1].leftSpace,
              style: context.appBarStyle?.coBoldBlack,
            ),
            TextSpan(text: LocalizationConst.codeOfLand[2].leftSpace),
          ],
        ),
      ),
    );
  }

  RowWithSpacing barList(BuildContext context) {
    return RowWithSpacing(
      spacing: context.widthHuge
          ? 16
          : context.widthLarge
              ? 8
              : 4,
      children: LocalizationConst.customAppBarList.toGesture(),
    );
  }

  ElevatedButton contactButton(BuildContext context) {
    double defaultSize = KDefaultConst.appBarSize * 0.6;
    return ElevatedButton(
      style: CustomButtonStyle(
        padding: EdgeInsets.zero,
        fixedSize: Size(defaultSize, defaultSize),
      ),
      onPressed: () {},
      child: Icon(Icons.settings_outlined, size: defaultSize * 0.8),
    );
  }
}
// }

