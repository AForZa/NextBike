import 'package:flutter/material.dart';

//Wie der Name schon verrät, hier werden unsere Button
//gestyled. Sowohl fürs Anmelden und Registrieren

class RoundedButtonStyle extends StatelessWidget {
  final String title;

  const RoundedButtonStyle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
