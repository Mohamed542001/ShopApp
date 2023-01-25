import 'package:flutter/material.dart';
import 'package:shopapp/general/screens/widgets/AppColors.dart';

class CustomInputFormField extends StatefulWidget {
  const CustomInputFormField(
      {Key? key,
        this.prefix,
        this.isNumber = false,
        this.controller,
        this.maxLines = 1,
        this.onSave,
        this.secure = false,
        this.hint='',
        this.validator,
        this.onChanged,
        this.suffixIcon,
        this.onTap,
        this.isNext = true,
        this.maxLength,
        this.upperText,
        this.hasLabel = false,
        this.isRTL = false,
        this.icon,
        this.hintColor = Colors.grey,
        this.horizontalMargin = 0,this.verticalMargin=7,
        this.multiLine = false,
        this.fillColor,
        this.textColor=Colors.black,
        this.labelColor,
        this.radius=15,
        this.iconColor=Colors.white,
        this.enabledBorderColor,
        this.initialValue,
        this.enabled,
        this.isRequired,
        this.readOnly=false,
        this.focusedBorder=const Color(0xFF818181),
        this.autofillHints,
        this.labeltxt, this.onFieldSubmitted,
      }
      ) : super(key: key);

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final String? labeltxt;
  final Function(String)? onSave,onChanged;
  final int? maxLines,maxLength;
  final IconData? icon;
  final Widget? suffixIcon,prefix;
  final TextEditingController? controller;
  final String? upperText,initialValue, hint;
  final bool? hasLabel,isNext,isRTL,multiLine,isRequired,secure,isNumber,enabled,readOnly;
  final double? horizontalMargin,radius,verticalMargin;
  final Color ?enabledBorderColor, fillColor,iconColor,labelColor,textColor,hintColor,focusedBorder;
  final Iterable<String>? autofillHints;

  @override
  State<CustomInputFormField> createState() => _CustomInputFormFieldState();
}

class _CustomInputFormFieldState extends State<CustomInputFormField> {

  late bool _showPassword;



  @override
  void initState() {
    _showPassword = widget.secure!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(widget.radius!);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.verticalMargin!, horizontal: widget.horizontalMargin!),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.upperText != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.upperText!,
                  style: const TextStyle(
                      color: Color(0xFF2C0C0C),
                    fontSize: 16
                  ),
                ),
              ),
            TextFormField(

              controller: widget.controller,
              validator: widget.validator,
              onFieldSubmitted: widget.onFieldSubmitted??(value){
                print(value);
              },
              keyboardType: widget.multiLine!
                  ? TextInputType.multiline
                  : widget.isNumber!
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              autofillHints:  widget.autofillHints,
              initialValue: widget.initialValue,
              onTap: widget.onTap,
              readOnly:widget.readOnly! ,
              obscureText: _showPassword,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              textInputAction: widget.multiLine!
                  ? TextInputAction.newline
                  : widget.isNext!
                  ? TextInputAction.next
                  : TextInputAction.done,
              enabled: widget.enabled,
              buildCounter: (context,
                  { required currentLength,
                    required isFocused,
                    maxLength}) =>
              null,
              style: TextStyle(color: widget.textColor,fontSize: 14,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  fillColor: widget.fillColor,
                  filled: true,
                  hintStyle: TextStyle(color: widget.hintColor??AppColors.textColor, fontSize: 16),
                  labelStyle: TextStyle(color: widget.labelColor??AppColors.textColor),
                  counterStyle:
                  const TextStyle(fontSize: 0, color: Colors.transparent),
                prefix: widget.prefix,
                prefixIcon: widget.icon == null
                    ? null
                    : Icon(
                    widget.icon,
               ),
                suffixIcon: widget.suffixIcon==null
                    ?widget.secure!
                    ?IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      _showPassword
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                      size: 14,
                    ),
                    onPressed: ()=>setState(() {
                       _showPassword = !_showPassword;
                    })
                )
                :null
                :widget.suffixIcon,

                labelText: widget.labeltxt,
                hintText: widget.hint,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: widget.maxLines == 1 ? 10 : 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide:  BorderSide(color: AppColors.formBgColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide:  BorderSide(color:AppColors.formBgColor ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(color: Colors.grey),
                  )
              ),


            ),
          ],
        ),
      ),
    );
  }
}
