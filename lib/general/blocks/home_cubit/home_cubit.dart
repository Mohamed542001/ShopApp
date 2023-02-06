import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/blocks/home_cubit/home_cubit.dart';
import 'package:shopapp/general/models/favorites_model/FavoritesModel.dart';
import 'package:shopapp/general/models/favorites_model/favorites/FavoritesModel.dart';
import 'package:shopapp/general/models/home_model/HomeModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  HomeModel? homeModel;
  Map<int?, bool?> favorites = {};

  void changeBottom(index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  void getHomeData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: ApiNames.home,
      token: ApiNames.token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data!.banners![0].image);
      print(homeModel?.status);

      homeModel?.data?.products?.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      print(favorites.toString());

      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  FavoritesModel favoritesModel = FavoritesModel();

  changeFavorites(int? productId) {
    favorites[productId] = !favorites[productId]!;

    emit(FavoritesLoadingState());

    DioHelper.postData(
            url: ApiNames.favorites,
            data: {"product_id": productId},
            token: ApiNames.token)
        .then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(value.data);

      if (!favoritesModel.status!) {
        favorites[productId] = !favorites[productId]!;
      } else{
        getFavorites();
      }

      emit(FavoritesSuccessState(favoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(FavoritesErrorState(error));
    });
  }

  FavoriteScreenModel? favoriteScreenModel;

  void getFavorites() {
    emit(FavoritesScreenLoadingState());
    DioHelper.getData(
      url:ApiNames.favorites,
      token: ApiNames.token,
    ).then((value) {
      favoriteScreenModel = FavoriteScreenModel.fromJson(value.data);
      print('fav data is ${value.data.toString()}');
      emit(FavoritesScreenSuccessState(favoriteScreenModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FavoritesScreenErrorState(error));
    });
  }
}
