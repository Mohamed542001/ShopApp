part of 'SettingsWidgetsImports.dart';

class BuildLogoutButton extends StatelessWidget {
  const BuildLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: 'Logout',
      onTap: () {
        CacheHelper.remove(key: 'token').then((value) {
          if (value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false,
            );
          }
        });
      },
    );
  }
}
