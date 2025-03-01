import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

ButtonStyle kButtonTransparentStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
  shape: const WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
  overlayColor: WidgetStatePropertyAll(AppColors.overlay),
);

ButtonStyle kButtonWhiteStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(AppColors.white),
  shape: WidgetStateProperty.all(
    const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14))),
  ),
  overlayColor: WidgetStateProperty.all(Colors.grey.withAlpha(40)),
);

ButtonStyle kButtonThemeStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(AppColors.primary),
  shape: WidgetStateProperty.all(
    const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14))),
  ),
  overlayColor: WidgetStateProperty.all(Colors.grey.withAlpha(40)),
);

ButtonStyle kButtonShadowThemeStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(AppColors.primary),
  shadowColor: WidgetStateProperty.all(AppColors.primary),
  shape: WidgetStateProperty.all(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
  overlayColor: WidgetStateProperty.all(Colors.grey.withAlpha(40)),
  elevation: WidgetStateProperty.all(5), // Adjust elevation as needed
);
