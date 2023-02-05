part of 'LoginWidgetsImports.dart';

class BuildLoginButton extends StatelessWidget {
  const BuildLoginButton({
    Key? key,
    required this.loginData,
  }) : super(key: key);
  final LoginData loginData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          if(state.loginModel.status = true){
            print(state.loginModel.message);
            print(state.loginModel.data?.token);
            CustomToast.showSimpleToast(
                msg: "${state.loginModel.message}",
            );
            CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
              ApiNames.token = state.loginModel.data?.token;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_)=>const Home()),
                      (route) => false
              );
            });
          }else{
            print(state.loginModel.message);
            CustomToast.showSimpleToast(
              msg: "${state.loginModel.message}",
              color: Colors.red,
              textColor: Colors.white
            );
          }
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ConditionalBuilder(
          condition: state is !LoginLoadingState,
          builder: (context) => DefaultButton(
            onTap: () {
              if (loginData.formKey.currentState!.validate()) {
                LoginCubit.get(context).userLogin(
                    email: loginData.emailController.text,
                    password: loginData.passwordController.text);
              }
            },
            margin: const EdgeInsets.all(0),
            title: 'Login',
            width: double.infinity,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
