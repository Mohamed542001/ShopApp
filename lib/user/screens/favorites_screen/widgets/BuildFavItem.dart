part of 'FavoritesWidgetsImports.dart';

class BuildFavItem extends StatelessWidget {
  const BuildFavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return state is FavoritesScreenLoadingState
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ))
            : ListView.separated(
                itemCount:
                    cubit.favoriteScreenModel!.data!.favoritesdata!.length,
                separatorBuilder: (context, i) => Divider(
                  thickness: 1,
                  color: AppColors.formBgColor,
                ),
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: 150,
                              child: Image.network(
                                '${cubit.favoriteScreenModel!.data!.favoritesdata![i].product!.image}',
                              ),
                            ),
                            if (cubit.favoriteScreenModel!.data!
                                    .favoritesdata![i].product!.discount !=
                                0)
                              Container(
                                color: Colors.red,
                                child: const Text(
                                  'DISCOUNT',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.favoriteScreenModel!.data!
                                      .favoritesdata![i].product!.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  cubit.favoriteScreenModel!.data!
                                      .favoritesdata![i].product!.description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '${cubit.favoriteScreenModel!.data!.favoritesdata![i].product!.price}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),


                                    if (cubit
                                            .favoriteScreenModel!
                                            .data!
                                            .favoritesdata![i]
                                            .product!
                                            .discount !=
                                        0)
                                      Text(
                                        '${cubit.favoriteScreenModel!.data!.favoritesdata![i].product!.oldPrice}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    IconButton(
                                      onPressed: () {
                                        cubit.changeFavorites(cubit
                                            .favoriteScreenModel!
                                            .data!
                                            .favoritesdata![i]
                                            .product!
                                            .id);
                                        // print(products![index].id);
                                      },
                                      icon: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: cubit.favorites[cubit
                                                .favoriteScreenModel!
                                                .data!
                                                .favoritesdata![i]
                                                .product!
                                                .id]!
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
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
