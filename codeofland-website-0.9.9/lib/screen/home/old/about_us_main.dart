import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/constants/screen_constant.dart';
import '../../../core/model/about_us_model.dart';

class AboutAsMain extends StatelessWidget {
  const AboutAsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        padding: context.padHorizontalS,
        decoration: BoxDecoration(
          gradient: HomeConstants.instance.mainBackgroundGradient,
        ),
        child: Center(child: _childMainAboutUs(context)));
  }

  Widget _childMainAboutUs(BuildContext context) {
    final ScrollController controller = ScrollController();

    AboutUsModel model = AboutUsModel(
      displayName: 'Halil Ücel',
      imageUrl: '',
      title: 'Ceo at UcelSoft',
    );
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      child: RowWithSpacing(
        spacing: context.width > context.mediumScreenSize ? 42 : 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AboutCardAtMain(model: model),
          AboutCardAtMain(model: model),
          AboutCardAtMain(model: model),
        ],
      ),
    );
  }
}

class AboutCardAtMain extends StatelessWidget {
  const AboutCardAtMain({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AboutUsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(''.randomImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.displayName!,
              style: context.textTheme.titleLarge!.coBoldBlack,
            ),
            Text(
              model.title!,
              style: context.textTheme.titleSmall!.coBoldBlack,
            ),
          ],
        ),
      ],
    );
  }
}
