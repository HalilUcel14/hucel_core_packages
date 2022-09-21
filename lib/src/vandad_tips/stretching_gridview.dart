import 'package:flutter/material.dart';

class CustomGridDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  const CustomGridDelegate({Key? key})
      : super(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        );
}
