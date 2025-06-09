import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final Widget? preicon;
  final Widget? suficon;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.preicon,
    this.suficon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.obscureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:52.h ,
      width:340.w ,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        cursorColor: MyColors.green,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: label,
          hintText: hintText,
          floatingLabelStyle: TextStyle(color: MyColors.green),
          prefixIcon: preicon != null ? preicon : null,
          suffixIcon: suficon != null ? suficon : null ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color:MyColors.green),
          ),          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
           borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color:MyColors.green),
          ),
        ),
      ),
    );
  }
}
