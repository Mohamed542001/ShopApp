part of 'ProductsImports.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  // ProductsData productsData = ProductsData();
  // HomeModel homeModel = HomeModel();
  // CategoriesModel categoriesModel = CategoriesModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildProductSlider(),
          const SizedBox(
            height: 20,
          ),
          const BuildProductsCategories(),
          BuildItemsGridView()
        ],
      ),
    );
  }
}
