import 'package:flutter/material.dart';

import 'app_colors.dart';

extension CustomColorScheme on ColorScheme {
  Color get textColor =>
      brightness == Brightness.light ? AppColors.midnightBlue : AppColors.white;

  Color get itemColor => brightness == Brightness.light
      ? AppColors.white
      : AppColors.backgroundDark;

  Color get bottomNavBarColor => brightness == Brightness.light
      ? AppColors.bottomBarLight
      : AppColors.bottomBarDark;

  Color get appBarColor => brightness == Brightness.light
      ? AppColors.appBarLight
      : AppColors.appBarDark;

  Color get containerColor => brightness == Brightness.light
      ? AppColors.containerLight
      : AppColors.containerDark;

  Color get shimmerBaseColor => brightness == Brightness.light
      ? AppColors.shimmerColor
      : AppColors.backgroundDark;

  Color get shimmerHighColor =>
      brightness == Brightness.light ? AppColors.white : AppColors.appBarDark;

  Color get dividerColor => brightness == Brightness.light
      ? const Color(0xFFeeeeee)
      : const Color(0xFFeeeeee);
}
