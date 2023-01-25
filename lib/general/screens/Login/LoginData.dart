part of 'LoginImports.dart';

class LoginData {
  bool visible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  userLogin(BuildContext context){
    if (formKey.currentState!.validate()) {
      LoginCubit.get(context).userLogin(
          email: emailController.text,
          password: passwordController.text);
    }
  }
}