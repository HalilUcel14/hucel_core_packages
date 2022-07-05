import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ErrorSnackbar extends SnackBar {
  ErrorSnackbar({
    Key? key,
    Color? colors = Colors.transparent,
    double elevations = 0.0,
    SnackBarBehavior? snackBarBehavior = SnackBarBehavior.floating,
    required List<String> errorList,
  }) : super(
          key: key,
          content: _SnackBarChild(
            errorList: errorList,
          ),
          backgroundColor: colors,
          elevation: elevations,
          behavior: snackBarBehavior,
        );
}

class _SnackBarChild extends StatelessWidget {
  const _SnackBarChild({Key? key, required this.errorList}) : super(key: key);
  final List<String> errorList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.heightXL / 2),
      child: Container(
        padding:
            EdgeInsets.only(top: context.heightL / 1.75, left: context.heightS),
        height: context.heightXXL * 1.5,
        width: double.infinity > 600 ? 600 : double.infinity,
        decoration: BoxDecoration(
          borderRadius: context.borderRadiusN,
          color: Colors.orange,
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              blurStyle: BlurStyle.solid,
              color: Colors.grey,
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
                      errorList[index],
                      style: TextStyle(
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
      ),
    );
  }
}
