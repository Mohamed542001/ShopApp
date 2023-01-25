import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/models/categories_model/CategoriesModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);


  CategoriesModel model = CategoriesModel();

  void getCategoriesData() {
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: ApiNames.categories,
      token: ApiNames.token,
    ).then((value) {
      model = CategoriesModel.fromJson(value.data);
      print(model.data?.modelData?[2].name);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState(error));
    });
  }
}
