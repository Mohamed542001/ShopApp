part of 'categories_cubit.dart';

abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}
class CategoriesLoadingState extends CategoriesStates{}
class CategoriesSuccessState extends CategoriesStates{

}
class CategoriesErrorState extends CategoriesStates{
  final String error;
  CategoriesErrorState(this.error);
}
