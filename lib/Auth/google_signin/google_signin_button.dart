import 'package:app_riverpod_version/Components/loading_error.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Components/animated_Button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/google_signin_controller.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<GoogleSignInState>(
      googleSignInProvider,
      (previous, current) {
        if (current == GoogleSignInState.loading) {
          LoadingSheet.show(context);
        } else if (current == GoogleSignInState.error) {
          Navigator.of(context).pop();
          ErrorDialog.show(context, "Google SignIn Failed");
        } else {
          Navigator.of(context).pop();
        }
      },
    );

    return AnimatedButton(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: const Text(
          "Anmelden mit Google",
          style: TextStyle(
            color: Color(0xFF9A9A9A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      onTap: () {
        ref.read(googleSignInProvider.notifier).signInWithGoogle();
      },
    );
  }
}
