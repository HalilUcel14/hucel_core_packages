import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ErrorSnackbars extends SnackBar {
  ErrorSnackbars({
    Key? snackbarKey,
    Key? mainBodyKey,
    double snackbarElevations = 0.0,
    SnackBarBehavior? snackBarBehavior = SnackBarBehavior.floating,
    SnackBarAction? snackbarAction,
    Animation<double>? snackbarAnimation,
    Clip snackbarClipBehavior = Clip.hardEdge,
    required List<String> errorList,
    EdgeInsetsGeometry? snackbarMargin,
    void Function()? snackbaronVisible,
    EdgeInsetsGeometry? snackbarPadding,
    ShapeBorder? snackbarShape,
    double? snackbarWidth,
    DismissDirection snackbarDismissDirection = DismissDirection.down,
    Decoration? mainBodyDecoration,
    TextStyle? errorTextStyle,
    Color? mainBodyDecorationColor,
    String? labelChar,
    String? labelText,
    TextStyle? labelTextStyle,
    TextStyle? labelCharStyle,
  }) : super(
          key: snackbarKey,
          content: _SnackBarChilds(
            key: mainBodyKey,
            labelChar: labelChar,
            labelText: labelText,
            labelCharStyle: labelCharStyle,
            labelTextStyle: labelTextStyle,
            errorList: errorList,
            decoration: mainBodyDecoration,
            errorTextStyle: errorTextStyle,
            decorationColor: mainBodyDecorationColor,
          ),
          animation: snackbarAnimation,
          clipBehavior: snackbarClipBehavior,
          dismissDirection: snackbarDismissDirection,
          action: snackbarAction,
          margin: snackbarMargin,
          padding: snackbarPadding,
          shape: snackbarShape,
          width: snackbarWidth,
          onVisible: snackbaronVisible,
          backgroundColor: Colors.transparent,
          elevation: snackbarElevations,
          behavior: snackBarBehavior,
        );

  ErrorSnackbars.error({
    Key? snackbarKey,
    Key? mainBodyKey,
    double snackbarElevations = 0.0,
    SnackBarBehavior? snackBarBehavior = SnackBarBehavior.floating,
    SnackBarAction? snackbarAction,
    Animation<double>? snackbarAnimation,
    Clip snackbarClipBehavior = Clip.hardEdge,
    required List<String> errorList,
    EdgeInsetsGeometry? snackbarMargin,
    void Function()? snackbaronVisible,
    EdgeInsetsGeometry? snackbarPadding,
    ShapeBorder? snackbarShape,
    double? snackbarWidth,
    DismissDirection snackbarDismissDirection = DismissDirection.down,
    Decoration? mainBodyDecoration,
    TextStyle? errorTextStyle,
    Color? mainBodyDecorationColor,
    String? labelChar = '!',
    String? labelText = 'Error',
    TextStyle? labelTextStyle,
    TextStyle? labelCharStyle,
  }) : super(
          key: snackbarKey,
          content: _SnackBarChilds(
            key: mainBodyKey,
            labelChar: labelChar,
            labelText: labelText,
            labelCharStyle: labelCharStyle,
            labelTextStyle: labelTextStyle,
            errorList: errorList,
            decoration: mainBodyDecoration,
            errorTextStyle: errorTextStyle,
            decorationColor: mainBodyDecorationColor,
          ),
          animation: snackbarAnimation,
          clipBehavior: snackbarClipBehavior,
          dismissDirection: snackbarDismissDirection,
          action: snackbarAction,
          margin: snackbarMargin,
          padding: snackbarPadding,
          shape: snackbarShape,
          width: snackbarWidth,
          onVisible: snackbaronVisible,
          backgroundColor: Colors.transparent,
          elevation: snackbarElevations,
          behavior: snackBarBehavior,
        );
}

class _SnackBarChilds extends StatelessWidget {
  const _SnackBarChilds({
    Key? key,
    required this.errorList,
    this.decoration,
    this.errorTextStyle,
    this.decorationColor,
    this.labelText,
    this.labelChar,
    this.labelTextStyle,
    this.labelCharStyle,
  }) : super(key: key);
  //
  final List<String> errorList;
  final Decoration? decoration;
  final TextStyle? errorTextStyle;
  final Color? decorationColor;
  //
  final String? labelText;
  final String? labelChar;
  final TextStyle? labelTextStyle;
  final TextStyle? labelCharStyle;
  //
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity > 600 ? 600 : double.infinity,
      child: Stack(
        children: [
          _mainContainer(context),
          _icons(context),
          _labels(context),
        ],
      ),
    );
  }

  Container _mainContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.heightL / 1.5,
        left: context.heightXS,
        right: context.heightXS,
      ),
      height: context.heightXXL * 1.75,
      margin: EdgeInsets.only(top: context.heightN),
      decoration: decoration ??
          BoxDecoration(
            borderRadius: context.borderRadiusN,
            color: decorationColor ?? Colors.orange,
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                blurStyle: BlurStyle.solid,
                color: Colors.black,
                spreadRadius: 1.5,
              ),
            ],
          ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            errorList.length,
            (index) => Row(
              children: [
                Expanded(
                  child: Text(
                    '* ${errorList[index]}',
                    style: errorTextStyle ??
                        TextStyle(
                          color: Colors.black,
                          fontSize: context.heightS * 0.9,
                        ),
                  ),
                ),
                SizedBox(height: context.heightN)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _icons(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: _defaultDecoration(context).copyWith(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            labelChar ?? '!',
            style: labelCharStyle ??
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.heightM,
                  color: Colors.black,
                ),
          ),
        ),
        width: context.heightL,
        height: context.heightL,
      ),
      left: context.heightN,
    );
  }

  Positioned _labels(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: _defaultDecoration(context).copyWith(
          borderRadius: BorderRadius.circular(context.heightS),
        ),
        width: context.heightL * 4,
        height: context.heightL,
        child: Center(
          child: Text(
            labelText ?? 'Upps Error',
            style: labelTextStyle ??
                TextStyle(
                  color: Colors.black,
                  fontSize: context.heightN,
                ),
          ),
        ),
      ),
      right: context.heightN,
    );
  }

  BoxDecoration _defaultDecoration(BuildContext context) {
    return BoxDecoration(
      color: decorationColor ?? Colors.orange,
      boxShadow: const [
        BoxShadow(
          blurRadius: 10,
          color: Colors.black,
          blurStyle: BlurStyle.solid,
          spreadRadius: 1,
        ),
      ],
    );
  }
}
