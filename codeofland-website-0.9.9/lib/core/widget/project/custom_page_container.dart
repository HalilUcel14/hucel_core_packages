import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class CustomPageContainer extends Container {
  late final BuildContext context;

  CustomPageContainer.white(
    this.context, {
    super.key,
    super.child,
    super.constraints,
    super.height,
    super.margin,
  }) : super(
          width: double.infinity,
          padding: context.padAllN,
          color: Colors.white,
        );
  CustomPageContainer.blue(
    this.context, {
    super.key,
    super.child,
    super.constraints,
    super.height,
    super.margin,
  }) : super(
          width: double.infinity,
          padding: context.padAllN,
          color: Colors.blue,
        );
}
