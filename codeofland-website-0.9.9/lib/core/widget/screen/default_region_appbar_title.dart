import 'package:flutter/material.dart';

import '../../constants/screen_constant.dart';
import 'custom_appbar_subtitle.dart';

extension ListToWidget on List<String> {
  List<Widget> toGesture() {
    final List<Widget> defaultList = [];
    for (var element in this) {
      defaultList.add(DefaultAppBarTitle(title: element));
    }
    return defaultList;
  }
}

class DefaultAppBarTitle extends StatefulWidget {
  const DefaultAppBarTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DefaultAppBarTitle> createState() => _DefaultAppBarTitleState();
}

class _DefaultAppBarTitleState extends State<DefaultAppBarTitle> {
  //
  Color bgColor = Colors.transparent;
  Color titleColor = Colors.black;

  //
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        bgColor = Colors.amber.shade700;
        titleColor = Colors.white;
        setState(() {});
      },
      onExit: (event) {
        bgColor = Colors.transparent;
        titleColor = Colors.black;
        setState(() {});
      },
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: CustomAppBarSubTitle(
            title: widget.title,
            style: HomeConstants.instance.appSubtitleStyle
                .copyWith(color: titleColor),
          ),
        ),
      ),
    );
  }
}
