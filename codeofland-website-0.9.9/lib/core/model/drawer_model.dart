import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../widget/screen/custom_appbar_subtitle.dart';

class DrawerModel {
  String title;
  String icon;

  DrawerModel({required this.icon, required this.title});
}

List<DrawerModel> drawerModel = [
  DrawerModel(icon: 'home', title: 'Home'),
  DrawerModel(icon: 'aboutUs', title: 'About Us'),
  DrawerModel(icon: 'project', title: 'Project'),
  DrawerModel(icon: 'blog', title: 'Blog'),
];

extension ListConvertWidget<T> on List<DrawerModel> {
  List<Widget> onListWidget() {
    final List<Widget> list = [];
    for (DrawerModel element in this) {
      final Widget tile = ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(element.icon.getPngIcon),
        ),
        title: CustomAppBarSubTitle(
          title: element.title,
          align: TextAlign.start,
          isFitted: false,
        ),
      );
      list.add(tile);
      list.add(const Divider());
    }
    return list;
  }
}
