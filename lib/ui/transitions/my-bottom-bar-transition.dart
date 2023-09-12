import 'package:flutter/cupertino.dart';

import '../../animation.dart';

class MyBottomBarTransition extends StatefulWidget {
  const MyBottomBarTransition(
      {super.key,
      required this.animation,
      //required this.backgroundColor,
      required this.child});

  final Animation<double> animation;

  //final Color backgroundColor;
  final Widget child;

  @override
  State<MyBottomBarTransition> createState() => _MyBottomBarTransitionState();
}

class _MyBottomBarTransitionState extends State<MyBottomBarTransition> {
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(OffsetAnimation(parent: widget.animation));

  late final Animation<double> heightAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: const BoxDecoration(/*color: widget.backgroundColor*/),
        child: Align(
          alignment: Alignment.topLeft,
          heightFactor: heightAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
