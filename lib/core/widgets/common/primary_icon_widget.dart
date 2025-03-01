import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf_viewer/config/theme/color_scheme.dart';

Widget primarySvgIcon(
  BuildContext context, {
  required String iconPath,
  double? size,
  Color? color,
}) {
  return SvgPicture.asset(
    iconPath,
    height: size ?? 24,
    width: size ?? 24,
    colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.textColor, BlendMode.srcIn),
  );
}

Widget primarySvgImage(
  BuildContext context, {
  required String imagePath,
  BoxFit? boxFit,
  double? height,
  double? width,
  Color? color,
}) {
  return SvgPicture.asset(
    imagePath,
    height: height,
    fit: boxFit ?? BoxFit.none,
    width: width,
    colorFilter:
        color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
  );
}

Widget primaryPngImage(
  BuildContext context, {
  required String imagePath,
  double? height,
  double? width,
}) {
  return Image.asset(
    imagePath,
    height: height,
    width: width,
  );
}

Widget primaryPngIcon(
  BuildContext context, {
  required String iconPath,
  double? size,
}) {
  return Image.asset(
    iconPath,
    height: size ?? 24,
    width: size ?? 24,
    color: Theme.of(context).colorScheme.textColor,
  );
}
