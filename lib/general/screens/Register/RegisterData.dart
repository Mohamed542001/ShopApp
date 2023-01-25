part of 'RegisterImports.dart';

class RegisterData {
  final formKey = GlobalKey<FormState>();
  bool visible = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}