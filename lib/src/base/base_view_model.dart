import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? baseContext;

  void setContext(BuildContext context);

  void init();
}
