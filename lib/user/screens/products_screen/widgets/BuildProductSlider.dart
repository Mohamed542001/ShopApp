part of 'ProductsWidgetsImports.dart';

class BuildProductSlider extends StatelessWidget {
  const BuildProductSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return state is HomeLoadingState
            ? const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ))
            :  CarouselSlider(
          items: cubit.homeModel.data?.banners?.map((e) =>
              Image(
                image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),).toList(),
          options: CarouselOptions(
            height: 250,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
