import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/blocks/home_cubit/home_cubit.dart';
import 'package:shopapp/general/models/home_model/HomeModel.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  HomeModel homeModel = HomeModel();
  Map<int?,bool?> favorites={};



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
      print(homeModel.data!.banners![0].image);
      print(homeModel.status);

      homeModel.data?.products?.forEach((element) {
        favorites.addAll({
          element.id:element.inFavorites,
        });
      });
      
      print(favorites.toString());

      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }
}
