part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailure => this == LoginStatus.failure;
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.exception,
    this.model,
  });

  final LoginStatus status;
  final AppException? exception;
  final User? model;

  LoginState copyWith({
    LoginStatus? status,
    AppException? exception,
    User? model,
  }) {
    return LoginState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        model,
      ];
}
