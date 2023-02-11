part of 'signup_validator_bloc.dart';

@immutable
abstract class SignupValidatorState {}

class SignupValidatorInitial extends SignupValidatorState {}

class SignUpLoadingState extends SignupValidatorState {}

class SignUpValidState extends SignupValidatorState {}

class SignUpErrorState extends SignupValidatorState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}
