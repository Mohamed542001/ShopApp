part of 'SettingsWidgetsImports.dart';

class BuildSettingForm extends StatelessWidget {
  const BuildSettingForm({Key? key, required this.settingsData})
      : super(key: key);
  final SettingsData settingsData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccessState) {}
        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          settingsData.nameController.text = cubit.userModel.data!.name!;
          settingsData.emailController.text = cubit.userModel.data!.email!;
          settingsData.phoneController.text = cubit.userModel.data!.phone!;
          return state is ProfileLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ))
              : Form(
                  key: settingsData.formKey,
                  child: Column(
                    children: [

                      if(state is UpdateProfileSuccessState)
                        LinearProgressIndicator(
                          color: AppColors.primary,
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputFormField(
                        controller: settingsData.nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name must not be empty';
                          }
                          return null;
                        },
                        labeltxt: 'Name',
                        prefix: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputFormField(
                        controller: settingsData.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name must not be empty';
                          }
                          return null;
                        },
                        labeltxt: 'Email',
                        prefix: const Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputFormField(
                        controller: settingsData.phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name must not be empty';
                          }
                          return null;
                        },
                        labeltxt: 'Phone',
                        prefix: const Icon(Icons.phone),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
