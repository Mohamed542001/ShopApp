import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/constants/CustomBlocObserver.dart';
import 'package:shopapp/general/screens/Login/LoginImports.dart';
import 'package:shopapp/general/screens/onBoarding/OnBoardingImports.dart';
import 'package:shopapp/general/utilities/main_data/MainDataImports.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/cache_helper.dart';
import 'package:shopapp/general/utilities/utils_functions/dio_helper.dart';
import 'package:shopapp/user/screens/home/HomeImports.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  ApiNames.token = CacheHelper.getData(key: 'token');

  Widget widget;

  dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');
  var token = ApiNames.token;
  token = CacheHelper.getData(key: 'token');
  print('token = $token');

  if (onBoarding != null) {
    if (ApiNames.token != null) {
      widget = const Home();
    } else {
      widget = const Login();
    }
  } else {
    widget = const OnBoarding();
  }

  print(onBoarding);

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.startWidget});

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
