import 'package:flutter/material.dart';

/// void main() {
///  ErrorWidget.builder = (FlutterErrorDetails details) {
///    return ErrorMaterialWidget(
///      details: details,
///    );
///  };
///  runApp(const MyApp());
/// }
class ErrorMaterialWidget extends StatelessWidget {
  //
  final FlutterErrorDetails details;
  final Widget? child;
  //
  const ErrorMaterialWidget({
    required this.details,
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: child ?? Containers(),
      ),
    );
  }

  Container Containers() {
    return Container(
      color: Colors.red,
      child: Text(
        details.exception.toString(),
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
