import 'package:flutter/material.dart';
//DIESE File ist unteranderem für die Animation zwischen Register
//und Login zuständig.

//Sie ist auch dafür zuständig für die ErrorMessages

//Quelle: Staggered animations

class SizeFaderSwitcher extends StatelessWidget {
  final Widget child;
  const SizeFaderSwitcher({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: ((child, animation) {
        final sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: const Interval(0.0, 0.5)),
        );

        final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: const Interval(0.5, 1.0)),
        );
//Hier Spielen die ersten 0-0.5 sekunden eine Rolle, denn von 0.0 - 0.5 ist die
//SizeAnimation am Start. Von 0.5 - 1.0 ist die Fade Animation am start.

        return FadeTransition(
          opacity: fadeAnimation,
          child: SizeTransition(
            sizeFactor: sizeAnimation,
            child: child,
          ),
        );
      }),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      duration: const Duration(
        milliseconds: 400,
      ),
      child: child,
    );
  }
}
