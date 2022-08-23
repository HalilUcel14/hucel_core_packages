import 'dart:isolate';

Stream<String> getMessages() {
  final rp = ReceivePort();
  return Isolate.spawn(_getMessages, rp.sendPort)
      .asStream()
      .asyncExpand((event) => rp)
      .takeWhile((element) => element is String)
      .cast();
}

void _getMessages(SendPort sp) async {
  await for (final now in Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now().toIso8601String(),
  ).take(10)) {
    sp.send(now);
  }
  Isolate.exit(sp);
}

//https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/isolate-stream-in-dart/isolate-stream-in-dart.md
void _testIt() async {
  await for (final msg in getMessages()) {
    msg.toString();
  }
}
