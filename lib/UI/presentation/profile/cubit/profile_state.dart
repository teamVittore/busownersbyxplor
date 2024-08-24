part of 'profile_cubit.dart';

final class ProfileEditError extends ProfileState {
  final String message;

  const ProfileEditError({required this.message});
}

final class ProfileEditLoading extends ProfileState {}

final class ProfileEditSuccess extends ProfileState {
  final ProfileModel profileModel;
  final String message;

  const ProfileEditSuccess({
    required this.profileModel,
    required this.message,
  });
}

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
