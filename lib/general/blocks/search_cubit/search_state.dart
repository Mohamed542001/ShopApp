part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState{}
class SearchSuccessState extends SearchState{
  final SearchModel searchModel;

  SearchSuccessState(this.searchModel);
}
class SearchErrorState extends SearchState{
  final String error;
  SearchErrorState(this.error);
}

// class SearchFavoritesLoadingState extends SearchState{}
// class SearchFavoritesSuccessState extends SearchState{
//   final FavoritesModel favoritesModel;
//
//   SearchFavoritesSuccessState(this.favoritesModel);
// }
// class SearchFavoritesErrorState extends SearchState{
//   final String error;
//   SearchFavoritesErrorState(this.error);
// }

