import 'package:flutter/material.dart';

import '../../animations/widget_animation.dart';

class WidgetAnimator extends StatelessWidget {
  final Widget? child;

  const WidgetAnimator({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Animator(
      time: wait(),
      child: child,
    );
  }
}
