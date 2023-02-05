part of 'SettingsImports.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  SettingsData settingsData = SettingsData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BuildSettingForm(settingsData: settingsData),
            BuildUpdateDataButton(settingsData: settingsData,),
            const BuildLogoutButton(),
          ],
        ),
      ),
    );
  }
}
