import 'package:flutter/material.dart';

class PaginatedImageListView extends StatelessWidget {
  const PaginatedImageListView({
    Key? key,
    this.width = double.infinity,
    required this.imageUrl,
    this.height,
  }) : super(key: key);

  final List<String> imageUrl;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final double heightSize = height ?? width / (16.0 / 9.0);
    return SizedBox(
      width: width,
      height: heightSize,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        clipBehavior: Clip.antiAlias,
        children: imageUrl.map(
          (e) {
            return SizedBox(
              width: width,
              height: heightSize,
              child: Image.network(
                e,
                height: heightSize,
                fit: BoxFit.cover,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
