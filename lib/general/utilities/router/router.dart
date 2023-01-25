part of 'routerImports.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnBoarding, initial: true),
    CustomRoute(
        page: Login,
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500),
    CustomRoute(
        page: Register,
        transitionsBuilder: TransitionsBuilders.zoomIn,
        durationInMilliseconds: 500),
    CustomRoute(
        page: Home,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500),
  ],
)
class $AppRouter {}