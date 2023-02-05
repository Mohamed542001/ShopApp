part of 'FavoritesWidgetsImports.dart';

class BuildFavItem extends StatelessWidget {
  const BuildFavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return cubit.favoriteScreenModel == null
            ? const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ))
            :  ListView.separated(
          itemCount: cubit.favoriteScreenModel!.data!.favoritesdata!.length,
          separatorBuilder: (context, i) =>
              Divider(
                thickness: 1,
                color: AppColors.formBgColor,

              ),
          itemBuilder: (context, i) {
            var cubit = HomeCubit.get(context);
            return SizedBox(
              height: 200,
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        image: NetworkImage(
                            '${cubit.favoriteScreenModel!.data?.favoritesdata?[i].product?.image}'
                        ),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      if (cubit.favoriteScreenModel!.data?.favoritesdata?[i].product?.discount !=
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
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.5),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'apple iphone 12 pro max',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                '${cubit.favoriteScreenModel!.data?.favoritesdata?[i].product?.price}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (cubit.favoriteScreenModel!.data?.favoritesdata?[i].product?.discount != 0)
                                Text(
                                  '${cubit.favoriteScreenModel!.data?.favoritesdata?[i].product?.oldPrice}',
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
                                  cubit.changeFavorites(cubit.favoriteScreenModel!.data?.favoritesdata?[i].product!.id);
                                  // print(products?[index].id);
                                },
                                icon: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: cubit.favorites[cubit.favoriteScreenModel!.data?.favoritesdata?[i].product?.id]!
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
