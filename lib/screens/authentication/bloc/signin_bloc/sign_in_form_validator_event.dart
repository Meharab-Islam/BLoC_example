part of 'sign_in_form_validator_bloc.dart';

@immutable
abstract class SignInFormValidatorEvent {}

class SigninTextChangeEvent extends SignInFormValidatorEvent {
  final String emailValue;
  final String passwordValue;
  SigninTextChangeEvent({
    required this.emailValue,
    required this.passwordValue,
  });
}

class SigninSubmittedButtonEvent extends SignInFormValidatorEvent {
  final String email;
  final String password;
  SigninSubmittedButtonEvent({
    required this.email,
    required this.password,
  });
}
