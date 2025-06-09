import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:myshop/core/constant/app_colors.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final Function(PhoneNumber fullNumber)? onChanged;

  const PhoneNumberField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      child: IntlPhoneField(
        controller: controller,
        cursorColor: MyColors.green,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          floatingLabelStyle:TextStyle(color:MyColors.green),
         // labelStyle: TextStyle(color:MyColors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.green),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        initialCountryCode: 'US',
        onChanged: onChanged
      ),
    );
  }
}
