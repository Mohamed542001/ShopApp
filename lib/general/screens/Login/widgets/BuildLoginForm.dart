part of 'LoginWidgetsImports.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key, required this.loginData,}) : super(key: key);
  final LoginData loginData;

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.loginData.formKey,
      child: Column(
        children: [
          CustomInputFormField(
            controller: widget.loginData.emailController,
            validator: (v){
              if(v!.isEmpty){
                return 'Enter your Email';
              }
            },
            hint: 'Email Address',
            icon: Icons.email,

          ),
          const SizedBox(
            height: 25,
          ),
          CustomInputFormField(
            controller: widget.loginData.passwordController,
            validator: (v){
              if(v!.isEmpty){
                return 'Password must not be empty';
              } else if(v.length<5){
                return 'Password is too short';
              }
            },
            secure: true,
            hint: 'Password',
            icon: Icons.lock,
            onFieldSubmitted: (value) {
              if (widget.loginData.formKey.currentState!.validate()) {
                LoginCubit.get(context).userLogin(
                    email: widget.loginData.emailController.text,
                    password: widget.loginData.passwordController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
