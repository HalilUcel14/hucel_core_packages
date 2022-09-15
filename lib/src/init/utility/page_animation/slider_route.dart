import 'package:flutter/material.dart';

enum SlideType { right, left, bottom, top, defauld }

extension SlideTypeExtension on SlideType {
  Route<T> route<T>(Widget page, RouteSettings settings) {
    switch (this) {
      case SlideType.right:
        return _SlideRightRoute(page: page, settings: settings);
      case SlideType.top:
        return _SlideTopRoute(page: page, settings: settings);
      case SlideType.bottom:
        return _SlideBottomRoute(settings: settings, page: page);
      case SlideType.left:
        return _SlideLeftRoute(page: page, settings: settings);
      case SlideType.defauld:
        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
    }
  }
}

class _SlideRightRoute<T> extends PageRouteBuilder<T> {
  _SlideRightRoute({RouteSettings? settings, required Widget page})
      : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child),
        );
}

class _SlideLeftRoute<T> extends PageRouteBuilder<T> {
  _SlideLeftRoute({RouteSettings? settings, required Widget page})
      : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class _SlideTopRoute<T> extends PageRouteBuilder<T> {
  _SlideTopRoute({RouteSettings? settings, required Widget page})
      : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class _SlideBottomRoute<T> extends PageRouteBuilder<T> {
  _SlideBottomRoute({required RouteSettings settings, required Widget page})
      : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
