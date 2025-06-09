import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/view/widget/custom_button.dart';
import 'package:myshop/view/widget/phone_number_textfield.dart';

class SplashPhone extends StatelessWidget {
  final TextEditingController phone_number_controller=TextEditingController();

  SplashPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Container(
        padding:EdgeInsets.fromLTRB(11.w, 111.h, 11.w, 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(
                  child: Image.asset(
                      'assets/phone.png',
                      width: 294.w,
                      height: 353.h,
                    ),
                ),
                  SizedBox(height: 46.h),
                  Text("Enter your mobile number",style:TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text("We need to verify you. We will send you a one time verification code. ",
                  style:TextStyle(fontSize: 14.sp),),
                  SizedBox(height: 28.h),
                  PhoneNumberField(
                    controller:phone_number_controller,
                    onChanged: (fullNumber) {
                      print("$fullNumber");
                      phone_number_controller.text="${fullNumber.number}";
                    },
                    ),
                  SizedBox(height: 9.h),
                  CustomButton(
                   text: "Next",
                   icon: Icons.arrow_right_alt,
                   onPressed:(){
                    
                  })
            ],
          ),
        ),
      ),
    );
  }
}