import 'package:flutter/material.dart';

typedef ResolveToWidget<T> = Widget Function(
  ConnectionState connectionState,
  AsyncSnapshot<T> snapshot,
);

extension Materialize on AsyncSnapshot {
  /// child: useFuture(Future).materialize((connectionState,snapshot) {
  ///   Switch(connectionState){
  ///     case ConnectionState.done:
  ///       return Text();
  ///     default:
  ///       CircularProgressIndicator();
  ///   }
  /// })
  Widget materialize(ResolveToWidget f) => f(connectionState, this);
}
