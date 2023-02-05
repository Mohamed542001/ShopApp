import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/blocks/login_cubit/login_states.dart';
import 'package:shopapp/general/models/login_model/LoginModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  LoginModel? loginModel ;

  void userLogin({required String email,required String password}){
    emit(LoginLoadingState());
    DioHelper.postData(url: ApiNames.login, data: {
      'email':email,
      'password':password,
    }).then((value){
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      ApiNames.token= loginModel?.data?.token;
      print('toooo${ApiNames.token}');
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

}