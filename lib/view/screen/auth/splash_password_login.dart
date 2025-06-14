import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/auth_controller.dart';
import 'package:myshop/controller/password_controller.dart';
import 'package:myshop/core/constant/app_colors.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/screen/auth/splash_phone_login.dart';
import 'package:myshop/view/widget/custom_button.dart';
import 'package:myshop/view/widget/auth/password_textfield.dart';

class SplashPhonePre extends StatelessWidget {
  final TextEditingController password_controller=TextEditingController();
  final visibilityController = Get.put(PasswordController());
  final AuthController controller = Get.put(AuthController());

  SplashPhonePre({super.key});

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
                      'assets/forgot_password.png',
                      width: 294.w,
                      height: 353.h,
                    ),
                ),
                  SizedBox(height: 40.h),
                  Text("Enter the password",style:TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text("It looks like you already have an account in this number. Please enter the password to proceed",
                  style:TextStyle(fontSize: 14.sp),),
                  SizedBox(height: 20.h),
                  PasswordTextField(
                    controller: password_controller,
                    visibilityController: visibilityController,
                    ),
                    SizedBox(height: 15.h),
                    TextButton(onPressed: (){
                      controller.generateCode();
                      Get.toNamed(AppRoutes.splash_otp);
                    }, child:Text("Forgot  Password?",style: TextStyle(color: MyColors.orange))),
                  SizedBox(height: 9.h),
                  CustomButton(
                   text: "Submit",
                   icon: Icons.arrow_right_alt,
                   onPressed:(){
                    userModel.password=password_controller.text;
                    controller.login(userModel.phone!,userModel.password!);
                  })
            ],
          ),
        ),
      ),
    );
  }
}