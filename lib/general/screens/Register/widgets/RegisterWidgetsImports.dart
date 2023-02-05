import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/general/blocks/register_cubit/register_cubit.dart';
import 'package:shopapp/general/screens/Login/LoginImports.dart';
import 'package:shopapp/general/screens/Register/RegisterImports.dart';
import 'package:shopapp/general/screens/widgets/CustomInputFormField.dart';
import 'package:shopapp/general/screens/widgets/DefaultButton.dart';
import 'package:shopapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:shopapp/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:shopapp/general/utilities/utils_functions/cache_helper.dart';
import 'package:shopapp/user/screens/home/HomeImports.dart';

part 'BuildRegisterText.dart';
part 'BuildRegisterForm.dart';
part 'BuildRegisterButton.dart';