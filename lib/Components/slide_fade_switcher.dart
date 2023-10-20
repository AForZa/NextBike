import 'package:flutter/material.dart';

//DIESE File ist unteranderem für die Animation zwischen Register
//und Login zuständig.

//Sie ist auch dafür zuständig für die ErrorMessages

//Quelle: Staggered animations

class SlideFadeSwitcher extends StatelessWidget {
  final Widget child;
  const SlideFadeSwitcher({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 800,
      ),
      transitionBuilder: ((child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation);

        final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );

//Hier Spielen die ersten 0-0.5 sekunden eine Rolle, denn von 0.0 - 0.5 ist die
//SizeTransition am Start. Von 0.5 - 1.0 ist die Fade Transition am start.

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      }),
      child: child,
    );
  }
}
