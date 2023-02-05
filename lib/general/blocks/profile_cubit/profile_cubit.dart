import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/models/login_model/LoginModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  static ProfileCubit get(context) => BlocProvider.of(context);

  LoginModel userModel = LoginModel();

  void getUserData() {
    emit(ProfileLoadingState());
    DioHelper.getData(
      url: ApiNames.profile,
      token: ApiNames.token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print(userModel.data?.name);
      emit(ProfileSuccessState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState(error));
    });
  }

  LoginModel? updateProfileModel;

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(UpdateProfileLoadingState());
    DioHelper.putData(
      url: ApiNames.updateProfile,
      token: ApiNames.token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      updateProfileModel = LoginModel.fromJson(value.data);
      print(updateProfileModel?.data?.name);
      emit(UpdateProfileSuccessState(updateProfileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileErrorState(error));
    });
  }

}
