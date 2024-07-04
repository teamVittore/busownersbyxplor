import 'dart:developer';

import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/dataSource/user_manager.dart';
import 'package:admin_app/core/models/user_profile_model.dart';
import 'package:admin_app/core/repository/authentication/authentication_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenManager _tokenManager = TokenManager();
  final UserProfileManager _profileManager = UserProfileManager();
  AuthenticationRepository authRepository = locator<AuthenticationRepository>();
  AuthBloc() : super(const AuthInitial(step: 0)) {
    // send the otp to email address
    on<OtpSendEvent>(
      (event, emit) async {
        emit(AuthLoading(step: event.step));
        var res = await authRepository.sendOtp(
            emailAddress: event.email.replaceAll(' ', ''));

        res.fold(
            (left) => emit(AuthError(
                  message: left.message.toString(),
                  step: state.step,
                )),
            (right) => emit(OtpSendedState(
                  step: 2,
                  email: event.email,
                )));
      },
    );

    on<OtpVerifyEvent>(
      (event, emit) async {
        emit(const AuthLoading(step: 5));
        var res = await authRepository.validateOTP(
            emailAddress: event.email, otp: int.parse(event.otp));
        if (res.isLeft) {
        } else {
          final String token = res.right.data['token'];
          await _tokenManager.storeToken(token);
          await _profileManager.addUserProfile(
            UserProfileModel.fromJson(res.right.data['userDetails']),
          );
        }
        res.fold(
            (left) => emit(AuthError(
                  message: left.message.toString(),
                  step: state.step,
                )),
            (right) => emit(OtpVerfiedState(
                  step: event.step,
                  message: right.message,
                )));
      },
    );
    on<AuthEvent>((event, emit) async {
      log("inital checking working state");
    });
    on<LogoutEvent>(
      (event, emit) async {
        await _tokenManager.removeToken();
        emit(const AuthInitial(step: 0));
      },
    );
    on<EditPhoneEvent>(
      (event, emit) {
        emit(const AuthLoading(step: 1));
        emit(const AuthInitial(step: 0));
      },
    );
  }
}
