part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState{}
class ProfileSuccessState extends ProfileState{
  final LoginModel userModel;

  ProfileSuccessState(this.userModel);
}
class ProfileErrorState extends ProfileState{
  final String error;
  ProfileErrorState(this.error);
}

class UpdateProfileLoadingState extends ProfileState{}
class UpdateProfileSuccessState extends ProfileState{
  final LoginModel updateProfileModel;

  UpdateProfileSuccessState(this.updateProfileModel);
}
class UpdateProfileErrorState extends ProfileState{
  final String error;
  UpdateProfileErrorState(this.error);
}

