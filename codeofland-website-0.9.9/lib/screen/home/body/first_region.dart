import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/localization_const.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/style_extension.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/project/response_text.dart';

class FirstRegion extends StatelessWidget {
  const FirstRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(
      children: [
        //
        DefaultTextType(
          widthFactor: 0.7,
          textCenter: true,
          text: LocalizationConst.madeByUcelsoft,
          style: context.responsiveTextHeadLine.coBoldWhite,
        ),
        //
        FractionallySizedBox(
          widthFactor: 0.7,
          child: LottieBuilder.network(
            'https://assets5.lottiefiles.com/packages/lf20_DACRJe6U8R.json',
          ),
        ),
        //
        DefaultTextType(
          widthFactor: 0.7,
          textCenter: true,
          textAlign: TextAlign.center,
          text: LocalizationConst.firtRegionSubTitle,
          style: context.responsiveHeadLine.color(Colors.white),
        ),
        //
        SizedBox(height: context.height * 0.01),
        //
        ElevatedButton(
          onPressed: () {},
          style: CustomButtonStyle(fixedSize: const Size(160, 42)),
          child: Text(
            'Get Started',
            style: context.buttonTextStyle.coBold,
          ),
        ),
        //
      ],
    );
  }
}
