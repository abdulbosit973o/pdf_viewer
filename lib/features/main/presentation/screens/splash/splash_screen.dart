import 'package:pdf_viewer/config/app_routes.dart';
import 'package:pdf_viewer/config/theme/app_colors.dart';
import 'package:pdf_viewer/config/theme/color_scheme.dart';
import 'package:pdf_viewer/core/constants/constants.dart';
import 'package:pdf_viewer/core/extensions/navigation_extension.dart';
import 'package:pdf_viewer/core/widgets/common/primary_icon_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/asset_res.dart';
import '../../../../../core/style/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    pushReplacementNamed(context, AppRoutes.homeScreen);
    // var localStorage = LocalStorage();
    // bool? isRegistered = localStorage.getBool(Constants.isRegistered);
    // if (isRegistered != null && isRegistered) {
    //   Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
    // } else {
    //   // Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LogoWithText(imageSize: 40, textSize: 28),
          Container(
            alignment: Alignment.center,
            child: primaryPngImage(
              context,
              imagePath: AssetRes.splashImage,
              height: 108,
              width: 108,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: Constants.appName,
                    style:
                        pbold.copyWith(fontSize: 22, color: AppColors.primary)),
                TextSpan(
                    text: '',
                    style: pbold.copyWith(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.textColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
