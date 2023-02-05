part of 'RegisterWidgetsImports.dart';

class BuildRegisterForm extends StatefulWidget {
  const BuildRegisterForm({Key? key, required this.registerData,}) : super(key: key);
  final RegisterData registerData;

  @override
  State<BuildRegisterForm> createState() => _BuildRegisterFormState();
}

class _BuildRegisterFormState extends State<BuildRegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.registerData.formKey,
      child: Column(
        children: [
          CustomInputFormField(
            controller: widget.registerData.userNameController,
            hint: 'Your Name',
            validator: (v){
              if(v!.isEmpty){
                return 'Enter Your Name';
              }
            },
            icon: Icons.drive_file_rename_outline,
          ),
          const SizedBox(
            height: 10,
          ),

          CustomInputFormField(
            controller: widget.registerData.phoneController,
            hint: 'Your Phone Number',
            validator: (v){
              if(v!.isEmpty){
                return 'Enter Your Phone Number';
              }
            },
            icon: Icons.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomInputFormField(
            controller: widget.registerData.emailController,
            hint: 'Your Email',
            validator: (v){
              if(v!.isEmpty){
                return 'Enter Your Email';
              }
            },
            icon: Icons.email,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomInputFormField(
            controller: widget.registerData.passwordController,
            validator: (v){
              if(v!.isEmpty){
                return 'Password must not be empty';
              } else if(v.length<5){
                return 'Password is too short';
              }
            },
            hint: 'Enter Your Password',
            secure: true,
            icon: Icons.lock,
          ),

        ],
      ),
    );
  }
}
