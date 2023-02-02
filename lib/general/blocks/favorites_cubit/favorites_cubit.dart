import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/models/favorites_model/FavoritesModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  FavoritesModel favoritesModel = FavoritesModel();

  void changeFavorites(int productId) {

    emit(FavoritesLoadingState());

    DioHelper.postData(url: ApiNames.favorites, data: {
      "product_id":productId
    })
        .then((value) {
          favoritesModel = FavoritesModel.fromJson(value);
          emit(FavoritesSuccessState());
    })
        .catchError((error) {
          emit(FavoritesErrorState(error));
    });
  }
}
