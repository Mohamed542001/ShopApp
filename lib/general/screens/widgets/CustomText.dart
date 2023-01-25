import 'package:flutter/material.dart';

import 'AppColors.dart';

class CustomText extends StatelessWidget{

  final String? title;
  final Color? color;
  final double? size;
  final int? maxLines;
  final TextAlign? align;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  const CustomText({super.key, this.title,this.color,this.maxLines,this.size,this.align,this.fontWeight,this.decoration});

  @override
  Widget build(BuildContext context) {
    
    return Text(
      title??'',
      maxLines: maxLines,
      textAlign: align??TextAlign.start,
      style: TextStyle(
        color: color??AppColors.textColor,
        fontSize: size??16,
        fontWeight: fontWeight,
        decoration: decoration?? TextDecoration.none,
      ),
    );
  }

}