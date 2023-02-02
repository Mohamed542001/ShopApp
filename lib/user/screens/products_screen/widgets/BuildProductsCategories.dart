part of 'ProductsWidgetsImports.dart';

class BuildProductsCategories extends StatelessWidget {
  const BuildProductsCategories({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);

        return state is CategoriesLoadingState
            ? const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ))
            :  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.model.data!.modelData!.length,
                  separatorBuilder: (context,i)=>const SizedBox(width: 10,),
                  itemBuilder: (context,i)=>SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children:  [
                        Image(
                          image: NetworkImage(
                            '${cubit.model.data?.modelData?[i].image}',
                          ),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.8),
                          width: double.infinity,
                          child: Text(
                            '${cubit.model.data?.modelData?[i].name}',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
