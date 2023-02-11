import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'sign_in_form_validator_event.dart';
part 'sign_in_form_validator_state.dart';

class SignInFormValidatorBloc
    extends Bloc<SignInFormValidatorEvent, SignInFormValidatorState> {
  SignInFormValidatorBloc() : super(SignInFormValidatorInitialState()) {
    on<SigninTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInFormValidatonErrorState(
            errorMessage: 'Please enter a valid email address'));
      } else if (event.passwordValue.length < 8) {
        emit(
          SignInFormValidatonErrorState(
              errorMessage: 'Your password is too short'),
        );
      } else {
        emit(SignInFormValidateState());
      }
    });

    on<SigninSubmittedButtonEvent>((event, emit) {
      emit(SignInFormLoadingState());
    });
  }
}
