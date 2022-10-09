import 'package:flutter/material.dart';

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
            builder: (context, snapshot) {
              return streamBuilderHelper(
                snapshot: snapshot,
                context: context,
              );
            },
            stream: stream,
            initialData: initialData,
            key: key,
          ),
        );
}

class CustomStreamBuilder extends StreamBuilder {
  CustomStreamBuilder({
    Key? key,
    required Widget Function(BuildContext, AsyncSnapshot<dynamic>) builder,
    String? initialData,
    Stream<dynamic>? stream,
    Widget? hasError,
    Widget? connectionNone,
    Widget? connectionWaiting,
    Widget? connectionActive,
    Widget? connectionDone,
  }) : super(
            key: key,
            stream: stream,
            initialData: initialData,
            builder: (context, snapshot) {
              return streamBuilderHelper(
                snapshot: snapshot,
                context: context,
                connectionActive: connectionActive,
                connectionDone: connectionDone,
                connectionNone: connectionNone,
                connectionWaiting: connectionWaiting,
                hasError: hasError,
              );
            });
}

Widget streamBuilderHelper({
  required AsyncSnapshot<dynamic> snapshot,
  required BuildContext context,
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
