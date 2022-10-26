import 'package:codeofland_website/core/enum/blog_page_enum.dart';
import 'package:codeofland_website/core/extension/style_extension.dart';
import 'package:codeofland_website/screen/blog/components/shared_blog.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/kDefault_constants.dart';
import '../../core/constants/localization_const.dart';
import '../../core/extension/context_extension.dart';

class SecondRegionBlogBody extends StatelessWidget {
  const SecondRegionBlogBody({super.key});

  @override
  Widget build(BuildContext context) {
    //
    double defaultHeight = KDefaultConst.appBarSize;
    //
    return Container(
      width: double.infinity,
      padding: context.responsivePadAll,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: defaultHeight,
                padding: context.padSymetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: context.borderRadiusTopN,
                  color: ColorConstant.primaryColor,
                ),
                child: Center(
                  child: FittedBoxText(
                    LocalizationConst().blogTitleName,
                    textAlign: TextAlign.center,
                    style: context.responsiveNormalHeadline.coBold,
                  ),
                ),
              ),
              //
              Container(
                width: double.infinity,
                height: defaultHeight,
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
                      foregroundColor: ColorConstant.primaryColor,
                      child: Icon(
                        Icons.person,
                        size: defaultHeight * 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
          //
          //
          Container(
            constraints: BoxConstraints(minHeight: context.mediumScreenSize),
            height: context.width * 0.6,
            padding: context.padSymetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: context.borderRadiusBottomN,
              color: ColorConstant.blogFieldColor,
            ),
            child: SingleChildScrollView(
              child: SharedBlogPage(
                blogMap: listBlog,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
