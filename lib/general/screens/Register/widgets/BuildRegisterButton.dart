part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  const BuildRegisterButton({
    Key? key,
    required this.registerData,
  }) : super(key: key);
  final RegisterData registerData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            if(state.registerModel.status = true){
              print(state.registerModel.message);
              print(state.registerModel.data?.token);
              CustomToast.showSimpleToast(
                msg: "${state.registerModel.message}",
              );
              CacheHelper.saveData(key: 'token', value: state.registerModel.data?.token).then((value) {
                ApiNames.token = state.registerModel.data?.token;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_)=>const Home()),
                        (route) => false
                );
              });
            }else{
              print(state.registerModel.message);
              CustomToast.showSimpleToast(
                  msg: "${state.registerModel.message}",
                  color: Colors.red,
                  textColor: Colors.white
              );
            }
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ConditionalBuilder(
            condition: state is !RegisterLoadingState,
            builder: (context) => DefaultButton(
              onTap: () {
                if (registerData.formKey.currentState!.validate()) {
                  RegisterCubit.get(context).userRegister(
                      name: registerData.userNameController.text,
                      phone: registerData.phoneController.text,
                      email: registerData.emailController.text,
                      password: registerData.passwordController.text,
                  );
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
      ),
    );
  }
}
