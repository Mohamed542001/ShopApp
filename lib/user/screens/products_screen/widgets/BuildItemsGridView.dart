part of 'ProductsWidgetsImports.dart';

class BuildItemsGridView extends StatelessWidget {
  const BuildItemsGridView({Key? key, required this.productsData})
      : super(key: key);
  final ProductsData productsData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var products = cubit.homeModel.data?.products;

        return state is HomeLoadingState
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ))
            : Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'New Products',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.44,
                        children: List.generate(
                            cubit.homeModel.data!.products!.length,
                            (index) => Container(
                                  color: AppColors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                '${cubit.homeModel.data?.products?[index].image}'),
                                            width: double.infinity,
                                            height: 200,
                                          ),
                                          if (cubit.homeModel.data
                                                  ?.products?[index].discount !=
                                              0)
                                            Container(
                                              color: Colors.red,
                                              child: const Text(
                                                'DISCOUNT',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${cubit.homeModel.data?.products?[index].name}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                height: 1.3,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${cubit.homeModel.data?.products?[index].price}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                if (cubit
                                                        .homeModel
                                                        .data
                                                        ?.products?[index]
                                                        .discount !=
                                                    0)
                                                  Text(
                                                    '${cubit.homeModel.data?.products?[index].oldPrice}',
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color:
                                                            AppColors.textColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    print(products?[index].id);
                                                  },
                                                  icon: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: cubit.favorites[products?[index].id]!
                                                        ? AppColors.primary
                                                        : AppColors.formBgColor,
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
