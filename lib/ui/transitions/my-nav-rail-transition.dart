import 'package:flutter/material.dart';

import '../../animation.dart';

class MyNavRailTransition extends StatefulWidget {
  const MyNavRailTransition(
      {super.key,
      required this.animation,
      //required this.backgroundColor,
      required this.child});

  final Animation<double> animation;
  final Widget child;
  //final Color backgroundColor;

  @override
  State<MyNavRailTransition> createState() => _MyNavRailTransitionState();
}

class _MyNavRailTransitionState extends State<MyNavRailTransition> {
  // The animations are only rebuilt by this method when the text
  // direction changes because this widget only depends on Directionality.
  late final bool ltr = Directionality.of(context) == TextDirection.ltr;
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: ltr ? const Offset(-1, 0) : const Offset(1, 0),
    end: Offset.zero,
  ).animate(OffsetAnimation(parent: widget.animation));
  late final Animation<double> widthAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: const BoxDecoration(/*color: widget.backgroundColor*/),
        child: AnimatedBuilder(
          animation: widthAnimation,
          builder: (context, child) {
            return Align(
              alignment: Alignment.topLeft,
              widthFactor: widthAnimation.value,
              child: FractionalTranslation(
                translation: offsetAnimation.value,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
