import 'package:pdf_viewer/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  Color get textColor => Theme.of(this).colorScheme.textColor;

  Color get containerColor => Theme.of(this).colorScheme.containerColor;

  Color get appBarColor => Theme.of(this).colorScheme.appBarColor;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
}
