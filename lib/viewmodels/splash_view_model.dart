import 'package:flutter/material.dart';

import '../services/shared_pref_service.dart';
import '../utils/routes/routes.dart';
import 'base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void onInitView(BuildContext context) {
    super.onInitView(context);
    _initialLaunchApp();
  }

  Future<void> _initialLaunchApp() async {
    await _initData();
  }

  Future<void> _initData() async {
    await Future.wait([
      SharedPrefService.instance.onInit(),
    ]);
    Future.delayed(const Duration(seconds: 2),() {
      Routes.goToMainScreen(context);
    },);
  }
}
