import 'package:flutter/material.dart';

//HIER FINDET DIE ANIMATION STATT

class TopShape extends CustomClipper<Path> {
  final AnimationController _controller;

  TopShape._(this._controller);

  static Widget draw(
    Color color,
    String text,
    AnimationController controller,
  ) {
    return ClipPath(
      clipper: TopShape._(controller),
      child: ColoredBox(
        color: color,
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Path getClip(Size size) {
    final path = Path();
    //STARTPOINT (ANIMATION)
    path.lineTo(
        0,
        Tween<double>(begin: 5, end: size.height * 2)
            .animate(_controller)
            .value);

    //SCND POINT (ANIMATION)
    path.cubicTo(
      size.width * 3,
      Tween<double>(begin: 0, end: size.height * 0.6842105263157895)
          .animate(_controller)
          .value,
      size.width * 0.3,
      Tween<double>(begin: 0, end: size.height * 0.5598086124401914)
          .animate(_controller)
          .value,
      size.width * -1.1,
      Tween<double>(
        begin: 0,
        end: size.height * 0,
      ).animate(_controller).value,
    );

//THRD POINT ANIMATION
    path.cubicTo(
      size.width * 0.34358974359,
      Tween<double>(begin: 0, end: size.height * 0.7942583732)
          .animate(_controller)
          .value,
      size.width * 0.3923076923,
      Tween<double>(begin: 0, end: size.height * 0.81818181818)
          .animate(_controller)
          .value,
      size.width * 0.45128205128,
      Tween<double>(begin: 0, end: size.height * 0.74641148325)
          .animate(_controller)
          .value,
    );

    //FOURTH POINT ANIMATION

    path.cubicTo(
      size.width * 0.51282051282051298,
      Tween<double>(begin: 0, end: size.height * 0.6746411483253588)
          .animate(_controller)
          .value,
      size.width * 0.5692307692307692,
      Tween<double>(begin: 0, end: size.height * 0.41626794258837206)
          .animate(_controller)
          .value,
      size.width * 0.7,
      Tween<double>(begin: 0, end: size.height * 0.6)
          .animate(_controller)
          .value,
    );

//FIFTH POINT ANIMATION

    path.cubicTo(
      size.width * 1.0,
      Tween<double>(begin: 0, end: size.height * 0.95)
          .animate(_controller)
          .value,
      size.width * 1,
      Tween<double>(begin: 0, end: size.height).animate(_controller).value,
      size.width * 3.0,
      Tween<double>(begin: 0, end: size.height).animate(_controller).value,
    );

//SIXTH POINT ANIMATION

    path.cubicTo(
      size.width * 0,
      Tween<double>(begin: 0, end: size.height).animate(_controller).value,
      size.width * 1.0,
      Tween<double>(begin: 0, end: size.height).animate(_controller).value,
      size.width,
      Tween<double>(begin: 0, end: size.height).animate(_controller).value,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
