part of'OnBoardingImports.dart';

class OnBoardingData{

  PageController boardController = PageController();
  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/onBoard.jpg',
        title: 'On Board 1 Title',
        body: 'On Board 1 Body'
    ),
    OnBoardingModel(
        image: 'assets/images/onBoard2.jpg',
        title: 'On Board 2 Title',
        body: 'On Board 2 Body'
    ),
    OnBoardingModel(
        image: 'assets/images/onBoard3.jpg',
        title: 'On Board 3 Title',
        body: 'On Board 3 Body'
    ),
  ];

  submit(BuildContext context){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>const Login()
          ),
        );
      }
    });
  }
}