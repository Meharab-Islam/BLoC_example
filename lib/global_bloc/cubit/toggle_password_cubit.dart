import 'package:flutter_bloc/flutter_bloc.dart';

// part 'toggle_password_state.dart';

class TogglePasswordCubit extends Cubit<bool> {
  TogglePasswordCubit() : super(true);

  toggleState() {
    if (state == true) {
      emit(false);
    } else {
      emit(true);
    }
  }
}
