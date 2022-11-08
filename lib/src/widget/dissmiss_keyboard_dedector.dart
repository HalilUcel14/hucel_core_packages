import 'package:flutter/material.dart';

class DissmissKeyboardWidget extends StatelessWidget {
  const DissmissKeyboardWidget({super.key, required this.child});
  //
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
