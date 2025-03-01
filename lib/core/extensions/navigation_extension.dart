import 'package:flutter/material.dart';

void closeDialog(BuildContext context, {dynamic arg}) {
  Navigator.of(context, rootNavigator: true).pop(arg);
}

void popScreen(BuildContext context, {dynamic arg}) {
  Navigator.of(context).pop(arg);
}

void pushNamed(BuildContext context, String route, {dynamic arg}) {
  Navigator.pushNamed(context, route, arguments: arg);
}

void pushReplacementNamed(BuildContext context, String route, {dynamic arg}) {
  Navigator.pushReplacementNamed(context, route, arguments: arg);
}
