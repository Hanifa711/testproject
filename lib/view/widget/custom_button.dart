import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? color;

  CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:55.h ,
      width: 343.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
         // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          backgroundColor:color??MyColors.green,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            
            Expanded(
              flex: 2,
              child: Center(child: Text(text,style: TextStyle(fontSize: 16.sp,color: Colors.white),))),
            if (icon != null) ...[
              
              Icon(icon,color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
