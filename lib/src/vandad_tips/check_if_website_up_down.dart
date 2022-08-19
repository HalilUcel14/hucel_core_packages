import 'dart:io';

class UpStatus {
  final bool isUp;
  final DateTime timeStamp;
  const UpStatus(this.isUp, this.timeStamp);
}

class Pling {
  final String url;
  final Duration interval;
  const Pling({required this.interval, required this.url});
  //
  Stream<UpStatus> checkIfUp() =>
      Stream.periodic(interval, (_) => DateTime.now()).asyncExpand(
        (now) => HttpClient()
            .headUrl(Uri.parse(url))
            .then((req) => req..followRedirects = false)
            .then((value) => value.close())
            .then((value) => value.statusCode == 200)
            .onError((error, stackTrace) => false)
            .then((value) => UpStatus(value, now))
            .asStream(),
      );
}

// const oneSecond = Duration(seconds: 1);
// const url = 'https://dart.dev';

// extension IsOrIsNot on bool {
//   String get isOrIsNot => this ? 'is' : 'is not';
// }

// void testIt() async {
//   final pling = Pling(
//     url: url,
//     interval: oneSecond,
//   );
//   await for (final upStatus in pling.checkIfUp()) {
//     final timestamp = upStatus.timestamp;
//     final isUpStr = upStatus.isUp.isOrIsNot;
//     print('$url $isUpStr up at $timestamp');
//   }
// }