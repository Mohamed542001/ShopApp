part of 'CategoriesWidgetsImports.dart';

class BuildCategoryItems extends StatelessWidget {
  const BuildCategoryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return ListView.separated(
          itemCount: cubit.model.data!.modelData!.length,
          separatorBuilder: (context, i) =>
              Divider(
                thickness: 1,
                color: AppColors.formBgColor,

              ),
          itemBuilder: (context, i) =>
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(
                        '${cubit.model.data?.modelData?[i].image}',),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${cubit.model.data?.modelData?[i].name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                        Icons.arrow_forward_ios_outlined
                    ),
                  ],
                ),
              ),

        );
      },
    );
  }
}
