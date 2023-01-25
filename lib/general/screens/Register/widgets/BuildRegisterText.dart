part of 'RegisterWidgetsImports.dart';

class BuildRegisterText extends StatelessWidget {
  const BuildRegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Register',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Register now to browse our hot offers',
            style: TextStyle(
                fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
