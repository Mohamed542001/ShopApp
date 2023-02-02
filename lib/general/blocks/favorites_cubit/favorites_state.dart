part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState{}
class FavoritesSuccessState extends FavoritesState{

}
class FavoritesErrorState extends FavoritesState{
  final String error;
  FavoritesErrorState(this.error);
}

