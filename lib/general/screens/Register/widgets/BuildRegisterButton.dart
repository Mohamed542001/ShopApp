part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  const BuildRegisterButton({
    Key? key,
    required this.registerData,
  }) : super(key: key);
  final RegisterData registerData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DefaultButton(
        onTap: (){
          final String name = registerData.userNameController.text;
          final String age = registerData.ageController.text;
          final String address = registerData.addressController.text;
          final String phone = registerData.phoneController.text;
          final String email = registerData.emailController.text;
        },
        margin: const EdgeInsets.all(0),
        title: 'Register Now',
        width: double.infinity,
      ),
    );
  }
}
