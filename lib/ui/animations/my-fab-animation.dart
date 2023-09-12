import 'dart:ui';

import 'package:flutter/material.dart';

import '../../animation.dart';


class MyFabAnimation extends StatefulWidget {
  const MyFabAnimation({
    super.key,
    required this.animation,
    this.elevation,
    this.onPressed,
    this.child,
  });

  final Animation<double> animation;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? elevation;

  @override
  State<MyFabAnimation> createState() =>
      _MyFabAnimation();
}

class _MyFabAnimation
    extends State<MyFabAnimation> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late final Animation<double> _scaleAnimation =
      ScaleAnimation(parent: widget.animation);
  late final Animation<double> _shapeAnimation =
      ShapeAnimation(parent: widget.animation);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FloatingActionButton(
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(lerpDouble(30, 15, _shapeAnimation.value)!),
          ),
        ),
        backgroundColor: _colorScheme.tertiaryContainer,
        foregroundColor: _colorScheme.onTertiaryContainer,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}