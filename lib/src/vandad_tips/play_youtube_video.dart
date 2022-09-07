import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoView extends StatelessWidget {
  VideoView({Key? key, required this.videoId}) : super(key: key);
  //
  final String videoId;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return WebView(
      key: _key,
      initialUrl: 'https://www.youtube.com/embed/$videoId',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

class YoutubeVideoView extends StatelessWidget {
  const YoutubeVideoView({
    Key? key,
    required this.videoId,
  })  : thumbnailUrl = 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg',
        super(key: key);
  //
  final String videoId;
  final String thumbnailUrl;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.0,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black.withAlpha(50),
            spreadRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: VideoView(videoId: videoId),
    );
  }
}
