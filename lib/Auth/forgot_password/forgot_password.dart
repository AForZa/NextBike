import 'package:app_riverpod_version/Components/Text_Field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'controller/forgot_password_controller.dart';

//HIER HANDELT ES SICH UM DAS PASSWORT VERGESSEN WIDGET UND KLASSE

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({super.key});

  String _getButtonText(FormzStatus status) {
    if (status.isSubmissionInProgress) {
      return "Wird gesendet..."; //Wurde auf den Knopf gedrückt mit der Richtigen Mail wird "Wird gesendet" angezeigt
    } else if (status.isSubmissionFailure) {
      return "Fehler"; //Sobald die Mail nicht abgeschickt wurde wird ein Error zurückgegeben
    } else if (status.isSubmissionSuccess) {
      return "Erfolgreich"; //Sobald die Mail  abgeschickt wurde wird ein isSubmissionSuccess zurückgegeben
    } else {
      return "Senden";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ForgotPasswordState = ref.watch(forgotPasswordProvider);
    final status = ForgotPasswordState.status;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldInput(
                hintText: "Gebe deine E-Mail an.",
                errorText: Email.showEmailErrorMessage(
                    // zeigt den ErrorText für die Mail
                    ForgotPasswordState.email.error),
                onChanged: (email) {
                  ref.read(forgotPasswordProvider.notifier).onEmailChange(
                      email); // Email wird entfernt, sprich man kann direkt eine neue mail angeben
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: status.isSubmissionInProgress
                        ? null
                        : () {
                            Navigator.of(context).pop();
                          },
                    child: const Text("Abbrechen"),
                  ),
                  TextButton(
                    //Submission des Passworts Button
                    onPressed: status.isSubmissionInProgress ||
                            status
                                .isSubmissionSuccess //Abfrage zum Checken, ob das email Feld leer ist
                        //Oder ob eine email gelesen wird. Wenn dann wird die Funktion Forgotpassword ausgeführt
                        ? null
                        : () {
                            ref
                                .read(forgotPasswordProvider.notifier)
                                .forgotPassword();
                          },
                    child: Text(_getButtonText(status)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
