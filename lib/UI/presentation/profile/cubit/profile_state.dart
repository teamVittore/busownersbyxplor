part of 'profile_cubit.dart';

final class ProfileFetched extends ProfileState {
  final ProfileModel profileModel;

  const ProfileFetched({required this.profileModel});
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoadingError extends ProfileState {}

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}
