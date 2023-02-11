part of 'sign_in_form_validator_bloc.dart';

@immutable
abstract class SignInFormValidatorState {}

class SignInFormValidatorInitialState extends SignInFormValidatorState {}

class SignInFormValidateState extends SignInFormValidatorState {}

class SignInFormValidatonErrorState extends SignInFormValidatorState {
  final String errorMessage;
  SignInFormValidatonErrorState({
    required this.errorMessage,
  });
}

class SignInFormLoadingState extends SignInFormValidatorState {}
