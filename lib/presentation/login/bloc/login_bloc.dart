import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginInitial()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading(isPasswordVisible: state.isPasswordVisible));

      final user = await loginUseCase(event.username, event.password);

      if (user != null) {
        emit(LoginSuccess(
          user,
          isPasswordVisible: state.isPasswordVisible,
        ));
      } else {
        emit(LoginFailure(
          "Invalid username or password",
          isPasswordVisible: state.isPasswordVisible,
        ));
      }
    });
  }
}
