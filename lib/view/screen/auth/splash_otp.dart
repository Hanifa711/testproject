import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/auth_controller.dart';
import 'package:myshop/core/constant/app_colors.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/widget/custom_button.dart';
import 'package:myshop/view/widget/auth/otp_widget.dart';

class SplashPhoneOTP extends StatelessWidget {
  final TextEditingController phone_number_controller=TextEditingController();
    final AuthController controller = Get.put(AuthController());
    String otpCode="";


  SplashPhoneOTP({super.key});

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
                  SizedBox(height: 30.h),
                  Text("Enter Verification Code",style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text("We have sent SMS to:\n01XXXXXXXXXX",
                  style:TextStyle(fontSize: 14.sp),),
                  SizedBox(height: 28.h),
                  OtpInputWidget(
                     onCompleted:(otp){
                         otpCode=otp;
                         print(otpCode);
                     }
                    ),
                  Row(
                    children: [
                      TextButton(onPressed: (){  
                        controller.generateCode();
                      }, 
                      child: Text("Resend OTP",style:TextStyle(color: MyColors.orange),)),
                      SizedBox(width: 40.w),
                      TextButton(onPressed: (){
                        Get.toNamed(AppRoutes.splash_phone) ; 
                      }, child: Text("Change Phone Number",style:TextStyle(color: Colors.grey))),
                    ],
                  ),
                  SizedBox(height: 9.h),
                  CustomButton(
                   text: "Next",
                   icon: Icons.arrow_right_alt,
                   onPressed:(){

                    if(controller.verifyCode(otpCode)){
                      Get.toNamed(AppRoutes.register_password);
                    }else{
                      Get.snackbar('Error', 'Incorrect OTP');
                    }
                    
                  })
            ],
          ),
        ),
      ),
    );
  }
}