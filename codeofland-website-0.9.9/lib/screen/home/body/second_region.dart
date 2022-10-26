import 'package:codeofland_website/core/widget/project/response_text.dart';
import 'package:codeofland_website/screen/home/second_region_blog_body.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/constants/kDefault_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/style_extension.dart';
import '../../../core/widget/project/custom_page_container.dart';

class SecondRegion extends StatelessWidget {
  const SecondRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageContainer.white(
      context,
      child: ColumnWithSpacing(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceSizedHeightBox(context: context, height: 0.1),
          //       sectionTitle(context),
          //title(context),
          const SecondRegionBlogBody(),
        ],
      ),
    );
  }

//
  Widget sectionTitle(BuildContext context) {
    return FittedBoxText(
      'BLOG',
      alignment: Alignment.topLeft,
      style: context.headline4?.coBold.size(
        context.widthN,
        minSize: 24,
      ),
    );
  }

  //
  Widget title(BuildContext context) {
    return DefaultTextType(
      widthFactor: 0.5,
      text: 'Last Shared Blog',
      style: context.headline6.coBold.size(context.widthS, minSize: 20),
    );
  }

  //

  Container child(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.padAllN,
      decoration: const BoxDecoration(color: Colors.white),
      child: ColumnWithSpacing(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: KDefaultConst.appBarSize * 0.75,
                    padding: context.padSymetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: context.borderRadiusTopN,
                      color: Colors.amber,
                    ),
                    child: title_blog(context),
                  ),
                  Container(
                    width: double.infinity,
                    height: KDefaultConst.appBarSize * 0.75,
                    padding: context.padSymetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: context.borderRadiusTopN,
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          child: Icon(
                            Icons.person,
                            size: KDefaultConst.appBarSize * 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 500),
                height: context.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: context.borderRadiusBottomN,
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget title_blog(BuildContext context) {
    return Center(
      child: FittedBoxText(
        'Blog Title Name',
        style: context.responsiveAllHeadLine.coBold,
      ),
    );
  }
}
