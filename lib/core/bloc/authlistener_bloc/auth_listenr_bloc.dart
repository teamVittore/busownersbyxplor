// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:admin_app/core/dataSource/db_const.dart';
import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_listenr_event.dart';
part 'auth_listenr_state.dart';

class AuthListenrBloc extends Bloc<AuthListenrEvent, AuthListenrState> {
  AuthListenrBloc() : super(AuthListenrInitial()) {
    on<AuthListenrEvent>((event, emit) {
      final isLoggedIn = Hive.box(token).isNotEmpty;
      if (isLoggedIn) {
        emit(AuthLoggedIn());
      } else {
        emit(AuthLoggedOut());
      }
    });
    on<AuthLoggedInEvent>(
      (event, emit) {
        log("AuthLoggedInEvent");
        emit(AuthLoggedIn());
      },
    );
    on<AuthLoggedOutEvent>(
      (event, emit) async {
        log("AuthLoggedOutEvent");
        await TokenManager().removeToken();
        // Navigator.pushAndRemoveUntil(
        //   event.context,
        //   MaterialPageRoute(
        //     builder: (context) => const AuthListener(),
        //   ),
        //   (route) => false,
        // );
        emit(AuthLoggedOut());
      },
    );
  }
}
