import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pdf_viewer/core/extensions/color_to_hsl.dart';

Color getDarkenColor(Color color) {
  final hslColor = color.toHSL();
  final darkenedColor = hslColor.withLightness(hslColor.lightness - 0.15);
  return darkenedColor.toColor();
}

Color getLightenColor(Color color) {
  final hslColor = color.toHSL();
  final lightenedColor = hslColor.withLightness(hslColor.lightness + 0.15);
  return lightenedColor.toColor();
}

void logD(dynamic message) {
  Logger().d(message);
}

void logI(dynamic message) {
  Logger().i(message);
}

void logW(dynamic message) {
  Logger().w(message);
}

void logE(dynamic message) {
  Logger().e(message);
}
