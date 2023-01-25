part of 'OnBoardingWidgetsImports.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({Key? key, required this.onBoardingData}) : super(key: key);
  final OnBoardingData onBoardingData;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: onBoardingData.boardController,
        count: onBoardingData.boarding.length,
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: AppColors.primary,
        dotHeight: 10,
        expansionFactor: 4,
        dotWidth: 10,
        spacing: 5,
      ),
    );
  }
}
