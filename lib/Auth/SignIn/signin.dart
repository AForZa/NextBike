import 'package:app_riverpod_version/Auth/SignIn/button.dart';
import 'package:app_riverpod_version/Auth/SignIn/controller/signin_controller.dart';
import 'package:app_riverpod_version/Auth/SignIn/email_field.dart';
import 'package:app_riverpod_version/Auth/SignIn/forgotpasswordbutton.dart';
import 'package:app_riverpod_version/Auth/SignIn/or_divider.dart';
import 'package:app_riverpod_version/Auth/SignIn/password_field.dart';
import 'package:app_riverpod_version/Auth/google_signin/google_signin_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../Components/loading_error.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(
      signInProvider,
      (previous, current) {
        if (current.status.isSubmissionInProgress) {
          LoadingSheet.show(context);
        } else if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ErrorDialog.show(context, "${current.errorMessage}");
        } else if (current.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        }
      },
    );

    return Column(
      children: const [
        EmailField(),
        SizedBox(
          height: 16,
        ),
        PasswordField(),
        ForgotPasswordButton(),
        SizedBox(
          height: 24,
        ),
        SignInButton(),
        OrDivider(),
        GoogleSignInButton(),
      ],
    );
  }
}
