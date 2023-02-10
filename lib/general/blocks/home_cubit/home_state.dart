part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{

}
class HomeErrorState extends HomeState{
}

class HomeChangeBottomNavState extends HomeState{}
class HomeChangeFavoriteButtonState extends HomeState{}

class FavoritesLoadingState extends HomeState{}
class FavoritesSuccessState extends HomeState{
  final FavoriteScreenModel? favoriteScreenModel;

  FavoritesSuccessState(this.favoriteScreenModel);
}
class FavoritesErrorState extends HomeState{
  final String error;
  FavoritesErrorState(this.error);
}

class FavoritesScreenLoadingState extends HomeState{}
class FavoritesScreenSuccessState extends HomeState{
  final FavoriteScreenModel favoritesModel;

  FavoritesScreenSuccessState(this.favoritesModel);
}
class FavoritesScreenErrorState extends HomeState{
  final String error;
  FavoritesScreenErrorState(this.error);
}

