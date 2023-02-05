part of 'FavoritesImports.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(20.0),
      child: BuildFavItem(),
    );
  }
}
