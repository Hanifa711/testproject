import 'package:flutter/material.dart';
import 'package:myshop/core/constant/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputWidget extends StatelessWidget {
  final Function(String) onCompleted;

  const OtpInputWidget({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 5,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 56,
        fieldWidth: 56,
        activeFillColor:Colors.grey[200],
        inactiveFillColor:Colors.grey[200] ,
        selectedFillColor:Colors.grey[200] ,
        activeColor: MyColors.green,
        selectedColor: Colors.grey,
        inactiveColor: Colors.transparent,
        
      ),
      animationDuration: const Duration(milliseconds: 300),
      onCompleted: onCompleted,
      enableActiveFill: true,
      onChanged: (value) {
        
        // Optionally track each change
      },
    );
  }
}
