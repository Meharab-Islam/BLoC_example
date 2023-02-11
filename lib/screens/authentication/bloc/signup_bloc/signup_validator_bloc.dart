import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
part 'signup_validator_event.dart';
part 'signup_validator_state.dart';

class SignupValidatorBloc
    extends Bloc<SignupValidatorEvent, SignupValidatorState> {
  SignupValidatorBloc() : super(SignupValidatorInitial()) {
    on<SignUpTextChangeEvent>((event, emit) {
      if (event.nameValue.isEmpty) {
        emit(
          SignUpErrorState(errorMessage: 'Name field cannot be empty'),
        );
      } else if (EmailValidator.validate(event.emailValue) == false) {
        emit(
          SignUpErrorState(errorMessage: 'Enter a valid email'),
        );
      } else if (event.passwordValue.length < 8) {
        emit(
          SignUpErrorState(
              errorMessage: 'Password must be at least 8 characters'),
        );
      } else if (event.designationValue.isEmpty) {
        emit(
          SignUpErrorState(errorMessage: 'Designation cannot be empty'),
        );
      } else {
        emit(SignUpValidState(),);
      }
    });
    on<SignUpTextSubmitedEvent>((event, emit) {});
  }
}
