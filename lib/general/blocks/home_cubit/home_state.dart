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

