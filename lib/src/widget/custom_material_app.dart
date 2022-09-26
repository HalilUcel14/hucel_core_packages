import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../hucel_core.dart';

class CustomMaterialApp extends MaterialApp {
  late final BuildContext context;
  CustomMaterialApp(
    this.context, {
    Key? key,
    GlobalKey<NavigatorState>? navigatorKey,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
    Widget? home,
    Map<String, Widget Function(BuildContext)> routes =
        const <String, WidgetBuilder>{},
    String? initialRoute,
    Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
    List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,
    Route<dynamic>? Function(RouteSettings)? onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    Widget Function(BuildContext, Widget?)? builder,
    String title = '',
    String Function(BuildContext)? onGenerateTitle,
    Color? color,
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeData? highContrastTheme,
    ThemeData? highContrastDarkTheme,
    ThemeMode? themeMode = ThemeMode.system,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Locale? Function(List<Locale>?, Iterable<Locale>)?
        localeListResolutionCallback,
    Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool debugShowMaterialGrid = false,
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = false,
    Map<ShortcutActivator, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    String? restorationScopeId,
    ScrollBehavior? scrollBehavior,
    bool useInheritedMediaQuery = false,
  }) : super(
          key: key,
          actions: actions,
          builder: builder ??
              (context, child) {
                return Stack(
                  children: [
                    child ?? const SizedBox.shrink(),
                    context.isMobile
                        ? const ConnectivityWidget()
                        : const SizedBox.shrink(),
                  ],
                );
              },
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          color: color,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          debugShowMaterialGrid: debugShowMaterialGrid,
          highContrastDarkTheme: highContrastDarkTheme,
          highContrastTheme: highContrastTheme,
          home: home,
          initialRoute: initialRoute,
          locale: locale ?? context.locale,
          localizationsDelegates:
              localizationsDelegates ?? context.localizationDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          navigatorKey: navigatorKey,
          navigatorObservers: navigatorObservers,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          onGenerateRoute: onGenerateRoute,
          onGenerateTitle: onGenerateTitle,
          onUnknownRoute: onUnknownRoute,
          restorationScopeId: restorationScopeId,
          routes: routes,
          scaffoldMessengerKey: scaffoldMessengerKey,
          scrollBehavior: scrollBehavior ?? WebForScrollBehavior(),
          shortcuts: shortcuts,
          showPerformanceOverlay: showPerformanceOverlay,
          showSemanticsDebugger: showSemanticsDebugger,
          supportedLocales: context.supportedLocales,
          theme: theme ?? context.themeProvider,
          themeMode: themeMode,
          title: title,
          useInheritedMediaQuery: useInheritedMediaQuery,
        );
}
