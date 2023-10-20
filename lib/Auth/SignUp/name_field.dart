import 'package:app_riverpod_version/Auth/SignUp/controller/signup_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Components/Text_Field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/signup_controller.dart';
import 'package:form_validators/form_validators.dart';

class NameField extends ConsumerWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.name.invalid;
    final SignUpController = ref.read(signUpProvider.notifier);
    return TextFieldInput(
      hintText: "Name",
      errorText:
          showError ? Name.showNameErrorMessage(signUpState.name.error) : null,
      onChanged: (name) => ref.read(signUpProvider.notifier).onNameChange(name),
    );
  }
}
