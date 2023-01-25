import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/screens/Login/LoginImports.dart';
import 'package:shopapp/general/screens/onBoarding/OnBoardingImports.dart';
import 'package:shopapp/general/utilities/main_data/MainDataImports.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';
import 'package:shopapp/user/screens/home/HomeImports.dart';
void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

    Widget widget;

    dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');
    ApiNames.token = CacheHelper.getData(key: 'token');

    if(onBoarding != null){
      if(ApiNames.token != null){
        widget = const Home();
      }else{
        widget = const Login();
      }
    }else{
      widget=const OnBoarding();
    }

    print(onBoarding);

  runApp(MyApp(startWidget: widget,));
}
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,this.startWidget});
  
  final Widget? startWidget;


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: MaterialApp(
          theme: MainData.lightTheme,
          darkTheme: MainData.darkTheme,
          debugShowCheckedModeBanner: false,
          home: startWidget,

      ),
    );
  }
}
