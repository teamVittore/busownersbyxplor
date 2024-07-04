part of 'auth_listenr_bloc.dart';

sealed class AuthListenrEvent extends Equatable {
  const AuthListenrEvent();

  @override
  List<Object> get props => [];
}

class AuthLoggedInEvent extends AuthListenrEvent {}

class AuthLoggedOutEvent extends AuthListenrEvent {
  final BuildContext context;

  const AuthLoggedOutEvent({required this.context});
}

class AuthStateChanged extends AuthListenrEvent {
  const AuthStateChanged();

  @override
  List<Object> get props => [];
}
