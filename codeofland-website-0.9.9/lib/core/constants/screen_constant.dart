import '../model/main_page_model.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class HomeConstants {
  static HomeConstants? _instance;
  static HomeConstants get instance {
    _instance ??= HomeConstants._init();
    return _instance!;
  }

  HomeConstants._init();

  ///
  ///
  Color appBarColor = Colors.white;
  LinearGradient mainBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: ['0B79CE'.color, '0D8ADA'.color],
  );

  ///
  ///
  BoxDecoration get customAppBarDecoration => BoxDecoration(
        color: appBarColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black54,
            blurStyle: BlurStyle.solid,
          ),
        ],
      );

  TextStyle appTitleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  TextStyle appSubtitleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  MainPageModel mainPage = MainPageModel(
      mainUrl:
          'https://assets9.lottiefiles.com/private_files/lf30_xeb8piyr.json',
      title: 'Made By Ucelsoft',
      appBarTitle: ['Code', 'Of', 'Land'],
      subTitle:
          'blabalbabalbabalblalblalbalblalbllabblalbalblablballbalbalbalbalbalbalablballbblalabla');
}
