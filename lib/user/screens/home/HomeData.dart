part of 'HomeImports.dart';

class HomeData{
  late TabController tabController;
  List<Widget> screens= const [
    Products(),
    Categories(),
    Favorites(),
    Search(),
  ];

  var items=const [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: 'Categories',
      icon: Icon(Icons.apps),
    ),
    BottomNavigationBarItem(
      label: 'Favorite',
      icon: Icon(Icons.favorite),
    ),
    BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.settings),
    ),
  ];
}