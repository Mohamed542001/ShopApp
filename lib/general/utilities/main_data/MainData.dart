part of 'MainDataImports.dart';

class MainData{
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.blueGrey,
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    scaffoldBackgroundColor: Colors.white
    ,
    appBarTheme:  AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.primary,
        ),
        titleSpacing: 20,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontFamily: 'Janna',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:Colors.blue ,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: Colors.red,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 4, color: Colors.white,height: 1.3),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.blueGrey,
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.white10,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'Janna',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black,height: 1.3),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: Colors.white,
    ),
  );

  static List<BlocProvider> providers(BuildContext context) =>[
    BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(),
    ),
    BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit()..getHomeData()..getFavorites(),
    ),
    BlocProvider<CategoriesCubit>(
      create: (BuildContext context) => CategoriesCubit()..getCategoriesData(),
    ),
  ];
}