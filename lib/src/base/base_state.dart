import 'package:flutter/material.dart';
import 'package:hucel_core/src/extension/context_extension.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double dynamicHeight(double value) => context.dynamicHeight(value);
  double dynamicWidth(double value) => context.dynamicWidth(value);
}

abstract class BaseStateless extends StatelessWidget {
  //

}
