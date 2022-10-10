import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class RoundedImageWithShadow extends StatelessWidget {
  const RoundedImageWithShadow({Key? key, required this.url}) : super(key: key);
  //
  final String url;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withAlpha(40),
            spreadRadius: 2,
          )
        ],
      ),
      child: HUNetworkImage(imageUrl: url), // Image.network(url),
    );
  }
}

class RoundedImageWithGridViewOrientation extends StatelessWidget {
  const RoundedImageWithGridViewOrientation({
    Key? key,
    required this.gridPortraitCount,
    required this.gridLandscapeCount,
    required this.networkImageUrl,
  }) : super(key: key);

  final int gridPortraitCount;
  final int gridLandscapeCount;
  final List<String> networkImageUrl;
  //
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final int count;
        switch (orientation) {
          case Orientation.portrait:
            count = gridPortraitCount;
            break;
          case Orientation.landscape:
            count = gridLandscapeCount;
            break;
        }
        return GridView.count(
          crossAxisCount: count,
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: networkImageUrl
              .map((e) => RoundedImageWithShadow(url: e))
              .toList(),
        );
      },
    );
  }
}
