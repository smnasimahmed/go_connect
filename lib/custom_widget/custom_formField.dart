import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class CustomTextFormField extends StatelessWidget {
  final bool numaric;
  final String fromTitle;
  final Widget? hintText;
  final int maxLine;
  final int? minLines;
  final TextEditingController textController;
  final String? Function(String?) validator;
  final Color? backgroundColor;

  const CustomTextFormField({
    super.key,
    required this.fromTitle,
    this.numaric = false,
    this.hintText,
    this.maxLine = 1,
    this.minLines,
    this.backgroundColor,
    required this.textController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Customtext(
            top: 5,
            bottom: 2,
            title: fromTitle,
            textSize: AppSize.width(value: 14),
            fontWeight: FontWeight.w600,
          ),
          TextFormField(
            style: TextStyle(
              color: ConstColour.textColor,
              fontSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              decorationThickness: 0,
            ),
            validator: validator,
            controller: textController,
            minLines: minLines,
            maxLines: maxLine,
            textInputAction: TextInputAction.done,
            keyboardType: numaric ? TextInputType.number : null,
            cursorColor: ConstColour.primaryColor,
            decoration: InputDecoration(
              filled: backgroundColor != null,
              fillColor: backgroundColor,
              hoverColor: ConstColour.primaryColor,
              hintStyle: TextStyle(
                color: ConstColour.textColor,
                fontSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              // hintText: hintText,
              hint: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ConstColour.cardBorderColour),
                borderRadius: BorderRadius.circular(100),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ConstColour.cardBorderColour),
                borderRadius: BorderRadius.circular(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(100),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(100),
              ),
              errorStyle: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
