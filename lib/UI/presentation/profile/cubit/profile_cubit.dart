import 'package:admin_app/UI/presentation/profile/models/profile_model.dart';
import 'package:admin_app/UI/presentation/profile/repository/profile_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository = locator<ProfileRepository>();
  ProfileCubit() : super(ProfileInitial());
  getProfile() async {
    emit(ProfileLoading());
    var res = await _profileRepository.getProfile();

    res.fold(
      (left) => emit(ProfileLoadingError()),
      (right) =>
          emit(ProfileFetched(profileModel: ProfileModel.fromJson(right.data))),
    );
  }
}
