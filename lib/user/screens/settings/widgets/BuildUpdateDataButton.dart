part of 'SettingsWidgetsImports.dart';

class BuildUpdateDataButton extends StatelessWidget {
  const BuildUpdateDataButton({Key? key, required this.settingsData})
      : super(key: key);
  final SettingsData settingsData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          return DefaultButton(
            title: 'Update',
            onTap: () {
              if(settingsData.formKey.currentState!.validate()){
                cubit.updateUserData(
                    name: settingsData.nameController.text,
                    email: settingsData.emailController.text,
                    phone: settingsData.phoneController.text);
              }
            },
          );
        },
      ),
    );
  }
}
