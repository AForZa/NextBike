part of 'forgot_password_controller.dart';

//Hier  weisen wir der Email der error Message und dem Status
//Eine Variable zu
class ForgotPasswordState extends Equatable {
  final Email email;
  final FormzStatus status;
  final String? errorMessage;

  const ForgotPasswordState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  ForgotPasswordState copyWith({
    Email? email, //Ist die Email richtig?
    FormzStatus? status, //ist es möglich die Email zu senden?
    String? errorMessage, //Fehlermeldung
  }) {
    return ForgotPasswordState(
      email:
          email ?? this.email, //Wenn die Email richtig ist wird sie übernommen
      status: status ??
          this.status, //Wenn der Status richtig ist wird er übernommen
      errorMessage: errorMessage ??
          this.errorMessage, //Wenn ein Fehler da ist wird er  übernommen
    );
  }

  @override
  List<Object?> get props => [
        email,
        status,
      ];
}
