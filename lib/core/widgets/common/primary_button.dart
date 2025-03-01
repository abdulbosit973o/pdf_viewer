import 'package:flutter/material.dart';
import 'package:pdf_viewer/core/extensions/color_to_hsl.dart';

import '../../style/text_styles.dart';

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);

  final Duration animationDuration;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.child,
    this.text,
    this.hslColor,
    this.height = 48,
    this.width,
    this.elevation = 5.0,
    this.shadow,
    this.onPressed,
    this.borderRadius = BorderRadius.zero,
  }) : assert(height > 0);
  final Widget? child;
  final String? text;
  final HSLColor? hslColor;
  final double height;
  final double? width;
  final double elevation;
  final BoxShadow? shadow;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;

  @override
  PrimaryButtonState createState() =>
      PrimaryButtonState(const Duration(milliseconds: 100));
}

class PrimaryButtonState extends AnimationControllerState<PrimaryButton> {
  PrimaryButtonState(super.duration);

  bool _isDragInProgress = false;
  Offset _gestureLocation = Offset.zero;
  late BoxShadow shadow;

  void _handleTapDown(TapDownDetails details) {
    _gestureLocation = details.localPosition;
    animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    animationController.reverse();
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!_isDragInProgress && mounted) {
        animationController.reverse();
      }
    });
  }

  void _handleDragStart(DragStartDetails details) {
    _gestureLocation = details.localPosition;
    _isDragInProgress = true;
    animationController.forward();
  }

  void _handleDragEnd(Size buttonSize) {
    if (_isDragInProgress) {
      _isDragInProgress = false;
      animationController.reverse();
    }
    if (_gestureLocation.dx >= 0 &&
        _gestureLocation.dy < buttonSize.width &&
        _gestureLocation.dy >= 0 &&
        _gestureLocation.dy < buttonSize.height) {
      widget.onPressed?.call();
    }
  }

  void _handleDragCancel() {
    if (_isDragInProgress) {
      _isDragInProgress = false;
      animationController.reverse();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _gestureLocation = details.localPosition;
  }

  @override
  void initState() {
    shadow = widget.shadow ??
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(0, 2),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final totalHeight = widget.height + widget.elevation;
    var borderRadius = BorderRadius.zero;
    if (widget.borderRadius == BorderRadius.zero) {
      borderRadius = BorderRadius.circular(14);
    } else {
      borderRadius = widget.borderRadius;
    }
    return SizedBox(
      height: totalHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonSize = Size(constraints.maxWidth, constraints.maxHeight);
          return GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onHorizontalDragStart: _handleDragStart,
            onHorizontalDragEnd: (_) => _handleDragEnd(buttonSize),
            onHorizontalDragCancel: _handleDragCancel,
            onHorizontalDragUpdate: _handleDragUpdate,
            onVerticalDragStart: _handleDragStart,
            onVerticalDragEnd: (_) => _handleDragEnd(buttonSize),
            onVerticalDragCancel: _handleDragCancel,
            onVerticalDragUpdate: _handleDragUpdate,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                final top = animationController.value * widget.elevation;
                final hslColor =
                    widget.hslColor ?? Theme.of(context).primaryColor.toHSL();
                final bottomHslColor =
                    hslColor.withLightness(hslColor.lightness - 0.15);
                return Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: totalHeight - top,
                        width: widget.width,
                        decoration: BoxDecoration(
                          color: bottomHslColor.toColor(),
                          boxShadow: [shadow],
                          borderRadius: borderRadius,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: top,
                      child: Container(
                        height: widget.height,
                        width: widget.width,
                        decoration: ShapeDecoration(
                          color: hslColor.toColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: borderRadius,
                          ),
                        ),
                        child: Center(
                            child: widget.child ??
                                Text(
                                  widget.text ?? "",
                                  style: pmedium.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                )),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
