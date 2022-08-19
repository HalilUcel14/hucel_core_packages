import 'package:flutter/material.dart';

class _CustomBox extends StatelessWidget {
  final Widget child;

  const _CustomBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: Center(child: child),
    );
  }
}

class ImageNetworkInCircularProgressIndicator extends StatefulWidget {
  const ImageNetworkInCircularProgressIndicator(
      {Key? key, required this.imageUrl})
      : super(key: key);
  //

  final String imageUrl;
  //
  @override
  State<ImageNetworkInCircularProgressIndicator> createState() =>
      _ImageNetworkInCircularProgressIndicatorState();
}

class _ImageNetworkInCircularProgressIndicatorState
    extends State<ImageNetworkInCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    //
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      fit: BoxFit.fitWidth,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        _controller.reset();
        _controller.forward();
        return FadeTransition(
          opacity: _animation,
          child: _CustomBox(
            child: child,
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return _CustomBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white70,
              value: bytesLoaded / totalBytes,
              color: Colors.red[900],
              strokeWidth: 5,
            ),
          );
        } else {
          return child;
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Text('Error!');
      },
    );
  }
}


// final images = [
//   'https://bit.ly/3x7J5Qt',
//   'https://bit.ly/3ywI8l6',
//   'https://bit.ly/36fNNj9',
//   'https://bit.ly/3jOueGG',
//   'https://bit.ly/3wt11Ec',
//   'https://bit.ly/3ywzOla',
// ].map((url) => NetworkImageWithProgress(url: url)).expand(
//       (element) => [
//         element,
//         SizedBox(
//           height: 10.0,
//         )
//       ],
//     );

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: images.toList(),
//         ),
//       ),
//     );
//   }
// }