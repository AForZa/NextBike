import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Components/animated_Button.dart';
import 'package:flutter/material.dart';
import '../../Components/roundedButtonStyle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/auth_controller.dart';
import 'controller/signup_controller.dart';
import 'package:form_validators/form_validators.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignUpState = ref.watch(signUpProvider);
    final SignUpController = ref.read(signUpProvider.notifier);
    final bool isValidated = SignUpState.status.isValidated;
    final AuthUser = ref.watch(authProvider).user;
    final NameController = TextEditingController();

    return AnimatedButton(
      onTap: isValidated
          ? () {
              CollectionReference userRef =
                  FirebaseFirestore.instance.collection('users');
              SignUpController.signUpWithEmailAndPassword();
            }
          : null,
      child: const RoundedButtonStyle(title: "Registrieren"),
    );
  }
}
