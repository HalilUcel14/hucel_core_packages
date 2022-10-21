import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:provider/provider.dart';

import 'core/firebase/auth_service.dart';
import 'core/routes/app_routes.dart';

import 'core/theme/theme_dark.dart';
import 'core/theme/theme_light.dart';
import 'firebase_options.dart';

late ThemeManager themeManager;
late SharedManager shared;

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
// Firebase İn İnitializeApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
//Error Ekran Tasarımı
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorMaterialWidget(details: details);
  };
//
// İnstance için Alan
  ThemeManager.themeDataDark = ThemeDark.instance.theme;
  ThemeManager.themeDataLight = ThemeLight.instance.theme;
  themeManager = ThemeManager.instance;
  shared = SharedManager.instance;
//
//
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
//

//
  runApp(_easyLocalization());
}

EasyLocalization _easyLocalization() {
  return EasyLocalization(
    supportedLocales: [
      EasyLocaleConst.instance.enLocale,
      EasyLocaleConst.instance.trLocale,
    ],
    saveLocale: true,
    fallbackLocale: EasyLocaleConst.instance.enLocale,
    path: EasyLocaleConst.instance.localePath,
    child: _multiProvider(),
  );
}

MultiProvider _multiProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager.instance),
      Provider<FirebaseTestAuthService>(
        create: (context) =>
            FirebaseTestAuthService.instance(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) =>
            context.read<FirebaseTestAuthService>().authStateChange,
        initialData: null,
        catchError: (_, error) => 'Stream Provider Error : error',
      ),
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // WEB SCROLL
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,
//
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
//
      theme: context.themeProvider,
//
      builder: (context, child) {
        return Stack(
          children: [
            child ?? const SizedBox.shrink(),
            const ConnectivityWidget()
          ],
        );
      },
//
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.instance.routes,
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
