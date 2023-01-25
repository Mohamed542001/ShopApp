import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors{
  static Color primary =  const Color(0xFFEA6853);
  static Color white=const Color(0xFFFFFFFF);
  static Color textColor=const Color(0xFF2C0C0C);
  static Color formBgColor=const Color(0xFF818181);
  static Color buttonBorderColor=const Color(0xFF818181);

  static Color convertColor(String color){
    int hex = int.parse(color.replaceFirst("#", "0xff"));
    return Color(hex);
  }



}