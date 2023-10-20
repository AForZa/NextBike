import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

//DIESE FILE ZUSTÄNDIG FÜR DAS ANZEIGEN DES ERRORS
//SOBALD FALSCHE SIGN DATEN ANGEGEBEN WURDEN

class ErrorDialog extends StatelessWidget {
  final String error;
  const ErrorDialog._(this.error, {super.key});

  static Future<void> show(
    BuildContext context,
    String errorMessage,
  ) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => ErrorDialog._(errorMessage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(error),
      actions: [
        CupertinoDialogAction(
          child: const Text('ok'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class LoadingSheet extends StatelessWidget {
  const LoadingSheet._({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(48),
        ),
      ),
      context: context,
      builder: (_) => const LoadingSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.blueGrey.shade700,
          size: 80,
        ),
      ),
    );
  }
}
