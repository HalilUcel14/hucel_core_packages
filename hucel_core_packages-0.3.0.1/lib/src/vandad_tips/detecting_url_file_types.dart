import 'dart:io';

enum NetworkFileType { imageJpeg, imagePng, pdf, plainText, svg, unknown }

NetworkFileType networkFileTypeFrom(List<String> header) {
  try {
    final pattern = header.first.split(';').first;
    switch (pattern) {
      case 'image/jpeg':
        return NetworkFileType.imageJpeg;
      case 'image/png':
        return NetworkFileType.imagePng;

      case 'application/pdf':
        return NetworkFileType.pdf;
      case 'text/plain':
        return NetworkFileType.plainText;
      case 'image/svg+xml':
        return NetworkFileType.svg;

      default:
        return NetworkFileType.unknown;
    }
  } on StateError {
    return NetworkFileType.unknown;
  }
}

Future<NetworkFileType> typeOf(Uri url) =>
    HttpClient().headUrl(url).then((value) => value.close()).then(
          (value) => networkFileTypeFrom(
            value.headers[HttpHeaders.contentTypeHeader] ?? [],
          ),
        );
