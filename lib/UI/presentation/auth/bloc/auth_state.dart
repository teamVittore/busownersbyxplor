part of 'auth_bloc.dart';

final class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message, required super.step});
}

final class AuthInitial extends AuthState {
  const AuthInitial({required super.step});
}

final class AuthLoading extends AuthState {
  const AuthLoading({required super.step});
}

sealed class AuthState extends Equatable {
  final int step;
  const AuthState({required this.step});

  @override
  List<Object> get props => [];
}

final class OtpSendedState extends AuthState {
  final String email;
  const OtpSendedState({
    required super.step,
    required this.email,
  });
}

final class OtpVerfiedState extends AuthState {
  final String message;

  const OtpVerfiedState({
    required super.step,
    required this.message,
  });
}

final class OtpVerifyingState extends AuthState {
  const OtpVerifyingState({
    required super.step,
  });
}
