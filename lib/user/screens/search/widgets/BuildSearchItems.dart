part of 'SearchWidgetsImports.dart';

class BuildSearchItems extends StatelessWidget {
  const BuildSearchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return cubit.searchModel == null
            ? Center(
                child: Container(),
              )
            : ListView.separated(
                itemCount: cubit.searchModel!.data!.searchData!.length,
                separatorBuilder: (context, i) => Divider(
                  thickness: 1,
                  color: AppColors.formBgColor,
                ),
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              SizedBox(
                                width: 150,
                                child: cubit.searchModel!.data!.searchData![i].image == null?
                                const Placeholder()
                                :Image.network(
                                  '${cubit.searchModel!.data!.searchData![i].image}',
                                ),
                              ),
                              if (cubit.searchModel!.data!.searchData![i]
                                      .discount !=
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
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.searchModel!.data!.searchData![i].name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  cubit.searchModel!.data!.searchData![i]
                                      .description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${cubit.searchModel!.data!.searchData![i].price}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // Expanded(
                                      //   child: BlocConsumer<HomeCubit, HomeState>(
                                      //     listener: (context, state) {
                                      //       // TODO: implement listener
                                      //     },
                                      //     builder: (context, state) {
                                      //       var cubit = HomeCubit.get(context);
                                      //       return IconButton(
                                      //         onPressed: () {
                                      //           cubit.changeFavorites(cubit
                                      //               .favoriteScreenModel!
                                      //               .data!
                                      //               .favoritesdata![i]
                                      //               .product!
                                      //               .id);
                                      //           // print(products![index].id);
                                      //         },
                                      //         icon: CircleAvatar(
                                      //           radius: 20,
                                      //           backgroundColor: cubit.favorites[
                                      //                   cubit
                                      //                       .favoriteScreenModel!
                                      //                       .data!
                                      //                       .favoritesdata![i]
                                      //                       .product!
                                      //                       .id]!
                                      //               ? AppColors.primary
                                      //               : AppColors.formBgColor,
                                      //           child: Icon(
                                      //             Icons.favorite_border,
                                      //             color: AppColors.white,
                                      //           ),
                                      //         ),
                                      //       );
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
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
