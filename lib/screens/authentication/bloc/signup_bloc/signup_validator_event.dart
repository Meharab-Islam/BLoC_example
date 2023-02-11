part of 'signup_validator_bloc.dart';

@immutable
abstract class SignupValidatorEvent {}

class SignUpTextChangeEvent extends SignupValidatorEvent {
  final String nameValue;
  final String emailValue;
  final String passwordValue;
  final String designationValue;

  SignUpTextChangeEvent({required this.nameValue, required this.emailValue, required this.passwordValue, required this.designationValue,});

}

class SignUpTextSubmitedEvent extends SignupValidatorEvent {
  final String nameValue;
  final String emailValue;
  final String passwordValue;
  final String designationValue;

  SignUpTextSubmitedEvent({required this.nameValue, required this.emailValue, required this.passwordValue, required this.designationValue,});

}

