part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class EditPhoneEvent extends AuthEvent {
  final int step;
  final String phone;

  const EditPhoneEvent({required this.step, required this.phone});
}

final class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

final class OtpSendEvent extends AuthEvent {
  final int step;
  final String email;

  const OtpSendEvent({
    required this.step,
    required this.email,
  });
}

final class OtpVerifyEvent extends AuthEvent {
  final int step;
  final String email;
  final String otp;
  const OtpVerifyEvent({
    required this.step,
    required this.email,
    required this.otp,
  });
}
