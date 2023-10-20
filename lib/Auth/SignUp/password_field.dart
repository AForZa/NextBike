import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Components/Text_Field.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/signup_controller.dart';
import 'package:form_validators/form_validators.dart';

class PasswordField extends ConsumerWidget {
  PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignUpState = ref.watch(signUpProvider);
    final showError = SignUpState.password.invalid;
    final SignUpController = ref.read(signUpProvider.notifier);
    return TextFieldInput(
      hintText: "Password",
      obsecureText: true,
      errorText: showError
          ? Password.showPasswordErrorMessage(SignUpState.password.error)
          : null,
      onChanged: (password) => SignUpController.onPasswordChange(password),
    );
  }
}
