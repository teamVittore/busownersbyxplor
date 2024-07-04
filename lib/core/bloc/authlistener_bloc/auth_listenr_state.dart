part of 'auth_listenr_bloc.dart';

final class AuthListenrInitial extends AuthListenrState {}

sealed class AuthListenrState extends Equatable {
  const AuthListenrState();

  @override
  List<Object> get props => [];
}

class AuthLoggedIn extends AuthListenrState {}

class AuthLoggedOut extends AuthListenrState {}
