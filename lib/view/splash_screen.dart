import 'package:code_base_provider_flutter/utils/text_theme.dart';
import 'package:code_base_provider_flutter/view/widget/dialogs/gradient_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../res/constant/app_assets.dart';
import '../utils/dimens/dimens_manager.dart';
import '../viewmodels/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel viewModel;

  void _initViewModel(BuildContext context) {
    DimensManager();
    viewModel = SplashViewModel()..onInitView(context);
  }

  @override
  void initState() {
    super.initState();
    _initViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(48),
              child: Center(
                child: SvgPicture.asset(AppAssets.iconTest,width: 100),
              ),
            ),
          ),
          Text('From',style: TextThemeData.italicGrey),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientMask(child: SvgPicture.asset(
                  AppAssets.iconMeta,
                  width: 36,
                )),
                const SizedBox(width: 4,),
                GradientMask(child: Text('Meta',style: TextThemeData.mediumStyle,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
