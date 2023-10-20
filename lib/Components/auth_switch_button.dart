import 'package:flutter/material.dart';
import '../Components/slide_fade_switcher.dart';

//Diese File sorgt dafür, dass überprüft wird,
//ob sich der Nutzer Registrieren möchte oder ,
//ob er sich anmelden möchte.
//Dafür ist der AuthSwitchButton da.

const _kTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xFF9A9A9A),
);

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;

  const AuthSwitchButton({
    Key? key,
    required this.showSignIn,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: SlideFadeSwitcher(
              child: showSignIn
                  ? const Text(
                      "Neu hier? Jetzt Registrieren",
                      key: ValueKey("Anmelden"),
                      style: _kTextStyle,
                    )
                  : const Text(
                      "Schon Registriert? Jetzt Anmelden",
                      key: ValueKey("Registrieren"),
                      style: _kTextStyle,
                    )),
        ),
      ),
    );
  }
}
