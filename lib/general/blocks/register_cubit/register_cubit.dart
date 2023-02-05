import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/models/login_model/LoginModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  LoginModel? registerModel ;

  void userRegister({required String name,required String phone,required String email,required String password,}){
    emit(RegisterLoadingState());
    DioHelper.postData(url: ApiNames.register, data: {
      'name':name,
      'phone':phone,
      'email':email,
      'password':password,
    }).then((value){
      print(value.data);
      registerModel = LoginModel.fromJson(value.data);
      ApiNames.token= registerModel?.data?.token;
      print('toooo${ApiNames.token}');
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

}
