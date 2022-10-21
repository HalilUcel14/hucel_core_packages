import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/widget/animated_lottie_builder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedLottieNetwork(
          path:
              'https://assets2.lottiefiles.com/private_files/lf30_0o9pv7tm.json',
          pushNamed: AppRoutes.home,
          future: Future.delayed(
            const Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}
