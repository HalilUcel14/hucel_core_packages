import 'package:flutter/material.dart';

import '../init/cache/locale_manager_shared/shared_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;
  SharedManager? localeManager = SharedManager.instance;

  void setContext(BuildContext context);

  void init();
}
