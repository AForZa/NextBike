//BEINHALTET DEN LOGIN UND REGISTER PART
//Widget
import 'package:flutter/material.dart';
import '../Components/auth_switch_button.dart';
import 'signin/signin.dart';
import 'SignUp/signup.dart';
import '../Components/slide_fade_switcher.dart';
import '../Components/animationshape/animationshape.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool _showSignIn = true; //SORGT FÜR DEN WECHSEL VON LOGIN / REGISTER

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
              child: SlideFadeSwitcher(
                child: _showSignIn ? const SignIn() : const SignUp(),
              ),
            ),
          ),
          const AnimatedShape(
            color: Colors.grey,
            show: true,
            title: "Registrieren",
          ),
          AnimatedShape(
            color: Colors.black,
            show: !_showSignIn,
            title: "Moin Moin!",
          ),
          AuthSwitchButton(
            showSignIn: _showSignIn,
            onTap: () {
              setState(() {
                _showSignIn = !_showSignIn;
              });
            },
          ),
        ],
      ),
    );
  }
}
