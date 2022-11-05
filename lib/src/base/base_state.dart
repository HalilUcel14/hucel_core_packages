// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  //
  final LocaleFile localeFile = LocaleFile();
  final SharedManager sharedManager = SharedManager.instance;
  final ThemeManager themeManager = ThemeManager.instance;

  ///

}

abstract class BaseStateless extends StatelessWidget {
  BaseStateless({Key? key}) : super(key: key);

  ///

  final LocaleFile localeFile = LocaleFile();
  final ThemeManager themeManager = ThemeManager.instance;
  final SharedManager sharedManager = SharedManager.instance;
}
