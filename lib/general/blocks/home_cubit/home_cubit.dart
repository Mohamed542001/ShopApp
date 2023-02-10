import 'package:flutter_bloc/flutter_bloc.dart';
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

  changeFavorites(int? productId) {
    favorites[productId] = !favorites[productId]!;

    emit(FavoritesLoadingState());

    DioHelper.postData(
            url: ApiNames.favorites,
            data: {"product_id": productId},
            token: ApiNames.token)
        .then((value) {
      favoriteScreenModel = FavoriteScreenModel.fromJson(value.data);
      print(value.data);

      if (!favoriteScreenModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      }

      emit(FavoritesSuccessState(favoriteScreenModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(FavoritesErrorState(error));
    });
  }

  FavoriteScreenModel? favoriteScreenModel;

  void getFavorites() {
    emit(FavoritesScreenLoadingState());
    DioHelper.getData(
      url: ApiNames.favorites,
      token: ApiNames.token,
    ).then((value) {
      favoriteScreenModel = FavoriteScreenModel.fromJson(value.data);
      // favoriteScreenModel!.data!.favoritesData!.forEach((element) {
      //   favorites.addAll({
      //     element.product!.id: false,
      //   });
      // });
      print('fav data is ${value.data.toString()}');
      emit(FavoritesScreenSuccessState(favoriteScreenModel!));
    }).catchError((error) {
      print('error is ${error.toString()}');
      emit(FavoritesScreenErrorState(error));
    });
  }
}
