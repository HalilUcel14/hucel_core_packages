import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ExpandedStreamBuilder extends Expanded {
  ExpandedStreamBuilder({
    Key? expandKey,
    Key? key,
    int flex = 1,
    dynamic initialData,
    Stream<dynamic>? stream,
    required Widget Function(BuildContext, AsyncSnapshot<dynamic>) builder,
  }) : super(
          key: expandKey,
          flex: flex,
          child: StreamBuilder(
            builder: builder,
            stream: stream,
            initialData: initialData,
            key: key,
          ),
        );
}

Widget myStreamBuilderHelper({
  required AsyncSnapshot snapshot,
  Widget? hasError,
  Widget? connectionNone,
  Widget? connectionWaiting,
  Widget? connectionActive,
  Widget? connectionDone,
}) {
  if (snapshot.hasError) {
    return hasError ?? Text("Upps! I have an Error ${snapshot.error}");
  } else if (snapshot.hasData) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return connectionNone ?? const Text("Stream Connection is None");
      case ConnectionState.waiting:
        return connectionWaiting ??
            const CircularProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            );
      case ConnectionState.active:
        return connectionActive ??
            const Text("My Stream have a Datas is Active Connection");
      case ConnectionState.done:
        return connectionDone ?? const Text("My Stream Connection is Done");
      default:
        return const Text("Return is Default Connection");
    }
  } else {
    return const Text("Return is Else variant");
  }
}
