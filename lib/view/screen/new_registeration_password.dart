import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/confirm_password_controller.dart';
import 'package:myshop/controller/password_controller.dart';
import 'package:myshop/view/widget/custom_button.dart';
import 'package:myshop/view/widget/password_textfield.dart';

class NewRegisterationPassword extends StatelessWidget {
  final TextEditingController password_controller=TextEditingController();
  final TextEditingController confirm_controller=TextEditingController();
  final visibilityController = Get.put(PasswordController());
  final visibilityConfirmController = Get.put(ConfirmPasswordController());


  NewRegisterationPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Choose a Password",style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
      ),
      body:Container(
        padding:EdgeInsets.fromLTRB(11.w, 25.h, 11.w, 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("For the security & safety please choose a password",style:TextStyle(fontSize: 14.sp),
                  ),
                SizedBox(height:20.h,), 
                Center(
                  child: Image.asset(
                      'assets/signup.png',
                      width: 294.w,
                      height: 353.h,
                    ),
                ),
                  SizedBox(height: 46.h),
                  PasswordTextField(controller: password_controller,
                  visibilityController: visibilityController,),
                   SizedBox(height: 18.h),
                  PasswordTextField(controller: confirm_controller,
                  label: "Confirm Password",
                  visibilityController: visibilityConfirmController,),
                  SizedBox(height: 30.h),
                  CustomButton(
                   text: "Finish, Good to go",
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