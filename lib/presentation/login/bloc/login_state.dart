import '../../../domain/entities/user.dart';

abstract class LoginState {
  final bool isPasswordVisible;

  const LoginState({this.isPasswordVisible = false});

  LoginState copyWith({bool? isPasswordVisible});
}

class LoginInitial extends LoginState {
  const LoginInitial({super.isPasswordVisible});

  @override
  LoginInitial copyWith({bool? isPasswordVisible}) {
    return LoginInitial(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

class LoginLoading extends LoginState {
  const LoginLoading({required super.isPasswordVisible});

  @override
  LoginLoading copyWith({bool? isPasswordVisible}) {
    return LoginLoading(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess(
    this.user, {
    required super.isPasswordVisible,
  });

  @override
  LoginSuccess copyWith({bool? isPasswordVisible}) {
    return LoginSuccess(
      user,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(
    this.message, {
    required super.isPasswordVisible,
  });

  @override
  LoginFailure copyWith({bool? isPasswordVisible}) {
    return LoginFailure(
      message,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
