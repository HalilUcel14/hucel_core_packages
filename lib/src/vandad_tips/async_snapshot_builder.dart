import 'package:flutter/material.dart';

typedef AsyncSnapshotCallback<T> = Widget Function(
  BuildContext context,
  T? value,
);

class AsyncSnapshotBuilder<T> extends StatelessWidget {
  const AsyncSnapshotBuilder(
      {Key? key,
      required this.stream,
      this.onNone,
      this.onWaiting,
      this.onActive,
      this.onDone})
      : super(
          key: key,
        );
  //
  final Stream<T> stream;
  final AsyncSnapshotCallback<T>? onNone;
  final AsyncSnapshotCallback<T>? onWaiting;
  final AsyncSnapshotCallback<T>? onActive;
  final AsyncSnapshotCallback<T>? onDone;
  //

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            final callBack = onNone ?? (_, __) => const SizedBox.shrink();
            return callBack(context, snapshot.data);
          case ConnectionState.waiting:
            final callBack =
                onWaiting ?? (_, __) => const CircularProgressIndicator();
            return callBack(context, snapshot.data);
          case ConnectionState.active:
            final callBack = onActive ?? (_, __) => const SizedBox.shrink();
            return callBack(context, snapshot.data);
          case ConnectionState.done:
            final callBack = onDone ?? (_, __) => const SizedBox.shrink();
            return callBack(context, snapshot.data);
        }
      },
    );
  }
}
