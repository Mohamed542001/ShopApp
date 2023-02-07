import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/models/search_model/SearchModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
        url: ApiNames.search,
        token: ApiNames.token,
        data: {
      'text': text,
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.data);
      emit(SearchSuccessState(searchModel!));
    }).catchError((error) {
      print('error is ${error.toString()}');
      emit(SearchErrorState(error));
    });
  }

  // FavoritesModel favoritesModel = FavoritesModel();
  // Map<int?, bool?> favorites = {};


  // changeFavorites(int? productId) {
  //   favorites[productId] = !favorites[productId]!;
  //
  //   emit(SearchFavoritesLoadingState());
  //
  //   DioHelper.postData(
  //       url: ApiNames.favorites,
  //       data: {"product_id": productId},
  //       token: ApiNames.token)
  //       .then((value) {
  //     favoritesModel = FavoritesModel.fromJson(value.data);
  //     print(value.data);
  //
  //     if (!favoritesModel.status!) {
  //       favorites[productId] = !favorites[productId]!;
  //     } else{
  //       getFavorites();
  //     }
  //
  //     emit(FavoritesSuccessState(favoritesModel));
  //   }).catchError((error) {
  //     favorites[productId] = !favorites[productId]!;
  //     emit(FavoritesErrorState(error));
  //   });
  // }
}
