part of 'LoginWidgetsImports.dart';

class BuildNotHaveAcc extends StatelessWidget {
  const BuildNotHaveAcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
            'Don\'t have an account',
          style: TextStyle(
            fontSize: 18
          ),
        ),
        TextButton(
            onPressed: (){
              MaterialPageRoute(
                  builder: (context)=>const Register()
              );
            },
            child: CustomText(
              title: 'Register',
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            )
        )
      ],
    );
  }
}
