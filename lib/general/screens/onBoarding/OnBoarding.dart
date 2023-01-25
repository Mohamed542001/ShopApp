part of 'OnBoardingImports.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  
  OnBoardingData onBoardingData = OnBoardingData();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed:(){
                CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
                  if(value){
                    // context.router.push(const Login());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>const Login(),
                        ),
                    );
                  }
                });
              },
              child: CustomText(
                title: 'Skip',
                fontWeight: FontWeight.bold,
                size: 18,
                color: AppColors.primary,

              ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: OnBoardingImages(onBoardingData: onBoardingData,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnBoardingIndicator(onBoardingData: onBoardingData),
                OnBoardingButton(onBoardingData: onBoardingData),
              ],
            )
          ],
        ),
      ),
    );
  }
}
