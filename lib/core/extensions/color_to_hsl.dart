import 'package:flutter/material.dart';

extension ColorToHSL on Color {
  HSLColor toHSL() {
    double r = red / 255;
    double g = green / 255;
    double b = blue / 255;

    double max = [r, g, b].reduce((a, b) => a > b ? a : b);
    double min = [r, g, b].reduce((a, b) => a < b ? a : b);
    double delta = max - min;

    double h = 0.0;
    if (delta != 0) {
      if (max == r) {
        h = (g - b) / delta;
      } else if (max == g) {
        h = (b - r) / delta + 2;
      } else if (max == b) {
        h = (r - g) / delta + 4;
      }
    }

    h = (h / 6) % 1;

    double l = (max + min) / 2;

    double s = 0.0;
    if (delta != 0) {
      s = delta / (1 - (2 * l - 1).abs());
    }

    return HSLColor.fromAHSL(1.0, h * 360, s, l);
  }
}
