import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

part 'splash_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class SplashScreenViewModel = _SplashScreenViewModelBase
    with _$SplashScreenViewModel;

abstract class _SplashScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}
  //

}
