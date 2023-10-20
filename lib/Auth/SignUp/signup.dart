import 'package:app_riverpod_version/Auth/SignUp/controller/signup_controller.dart';
import 'package:app_riverpod_version/Auth/SignUp/name_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import '../SignUp/button.dart';
import '../SignUp/name_field.dart';
import '../SignUp/email_field.dart';
import '../SignUp/password_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../Components/loading_error.dart';

class SignUp extends ConsumerWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignUpState>(signUpProvider, (previous, current) {
      if (current.status.isSubmissionInProgress) {
        LoadingSheet.show(context);
      } else if (current.status.isSubmissionFailure) {
        Navigator.of(context).pop();
        ErrorDialog.show(context, "${current.errorMessage}");
      } else if (current.status.isSubmissionSuccess) {
        Navigator.of(context).pop();
      }
    });
    return Column(
      children: [
        NameField(),
        SizedBox(
          height: 16,
        ),
        EmailField(),
        SizedBox(
          height: 16,
        ),
        PasswordField(),
        SizedBox(
          height: 24,
        ),
        SignUpButton(),
      ],
    );
  }
}
