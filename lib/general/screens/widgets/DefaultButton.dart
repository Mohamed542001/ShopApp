import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'CustomText.dart';


class DefaultButton extends StatelessWidget {

  final String? title;
  final Function()? onTap;
  final Color? color;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final double? textSize;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? elev;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;

  const DefaultButton(
      {Key? key,
        this.title,
        this.onTap,
        this.color,
        this.textColor,
        this.textSize,
        this.textFontWeight,
        this.borderColor,
        this.width,
        this.elev,
        this.margin,
        this.borderRadius, this.height
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color border=borderColor??AppColors.primary;
    return Container(
      width: width??342,
      height: height??56,
      margin: margin??const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: color??AppColors.primary,


          shape: RoundedRectangleBorder(
            borderRadius: borderRadius??BorderRadius.circular(15),
            side: BorderSide(color: borderColor??border,width: 2),
          ),
          elevation: elev??0,
        ),
        child: CustomText(
          color: textColor??AppColors.textColor,
          size: textSize??20,
          title: '$title',
          fontWeight: textFontWeight??FontWeight.bold,
        ),

      ),
    );
  }
}
