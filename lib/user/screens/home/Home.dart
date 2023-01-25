part of 'HomeImports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeData homeData = HomeData();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const CustomText(
              title: 'Salla',
              size: 20,
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const Search())
                    );
                  },
                  icon: const Icon(Icons.search)
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(
                color: AppColors.primary,
                size: 24
            ),
            unselectedIconTheme: IconThemeData(
                color: AppColors.formBgColor,
                size: 24
            ),
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index){
              cubit.changeBottom(index);
            },
            items: homeData.items,
          ),
          body: homeData.screens[cubit.currentIndex],
        );
      },
    );
  }
}
