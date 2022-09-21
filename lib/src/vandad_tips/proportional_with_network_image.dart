import 'package:flutter/material.dart';

class ProportionalWidthNetworkImage extends StatelessWidget {
  const ProportionalWidthNetworkImage(
      {Key? key, required this.url, required this.widthProportional})
      : super(key: key);
  //
  final String url;
  final double widthProportional;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.network(
          url,
          loadingBuilder: ((context, child, loadingProgress) {
            final widget = loadingProgress == null
                ? child
                : const LinearProgressIndicator();
            return SizedBox(
              width: constraints.maxWidth * widthProportional,
              child: widget,
            );
          }),
        );
      },
    );
  }
}
