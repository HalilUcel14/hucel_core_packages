import 'package:codeofland_website/core/constants/kDefault_constants.dart';
import 'package:codeofland_website/screen/home/body/second_region.dart';
import 'package:codeofland_website/screen/home/body/third_region.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../core/constants/screen_constant.dart';

import 'body/first_region.dart';
import 'component/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _decoratedBody(context),
    );
  }

  DecoratedBox _decoratedBody(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: HomeConstants.instance.mainBackgroundGradient,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeCustomAppBar(),
              _scroolChild(context),
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  /// Top Field
  ///
  ///
  ///
  ///

  Widget _scroolChild(BuildContext context) {
    return ColumnWithSpacing(
      spacing: 16,
      children: [
        appBarSize,
        const FirstRegion(),
        appBarSize,
        const SecondRegion(),
        const ThirdRegion(),
        const SizedBox(height: 5000)
        // HomeScreenOnePage(),
        // LastPostedBlog(),
        // LastCodeArchive(),
        // const WeLastProjects(),
        // const AboutAsMain(),
      ],
    );
  }

  SizedBox get appBarSize => SizedBox(height: KDefaultConst.appBarSize);
}
