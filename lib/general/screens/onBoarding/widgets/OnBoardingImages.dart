part of 'OnBoardingWidgetsImports.dart';

class OnBoardingImages extends StatefulWidget {
  const OnBoardingImages({Key? key, required this.onBoardingData}) : super(key: key);
  final OnBoardingData onBoardingData;

  @override
  State<OnBoardingImages> createState() => _OnBoardingImagesState();
}

class _OnBoardingImagesState extends State<OnBoardingImages> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: PageView.builder(
        controller: widget.onBoardingData.boardController,
        onPageChanged: (index){
          if(index == widget.onBoardingData.boarding.length-1){
            setState(() {
              widget.onBoardingData.isLast=true;
            });
            print('last');
          }else{
            setState(() {
              widget.onBoardingData.isLast=false;
            });
            print('Not last');

          }
        },
        physics: const BouncingScrollPhysics(),
        itemCount: widget.onBoardingData.boarding.length,
        itemBuilder: (context, i) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.asset(
                    '${widget.onBoardingData.boarding[i].image}',
                  fit: BoxFit.fill,
                ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${widget.onBoardingData.boarding[i].title}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              title: widget.onBoardingData.boarding[i].body,
              size: 14,
              fontWeight: FontWeight.bold,
            ),

          ],
        ),
      ),
    );
  }
}
