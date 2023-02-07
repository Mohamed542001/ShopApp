part of 'SearchImports.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
  SearchData searchData = SearchData();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            BuildSearchForm(searchData: searchData),
            const Expanded(child: BuildSearchItems()),
            ],
        ),
      ),
    );
  }
}
