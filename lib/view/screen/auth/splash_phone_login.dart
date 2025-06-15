import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/auth_controller.dart';
import 'package:myshop/data/model/user_model.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/widget/custom_button.dart';
import 'package:myshop/view/widget/auth/phone_number_textfield.dart';

UserModel userModel =UserModel();
class SplashPhone extends StatelessWidget {
  final TextEditingController phone_number_controller=TextEditingController();
  final AuthController controller = Get.put(AuthController());
  
  SplashPhone({super.key});

  @override
  Widget build(BuildContext context) {
    String  phone="";
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
                      phone="${fullNumber.countryCode}${fullNumber.number}";
                      userModel.phone=phone;
                    },
                    ),
                  SizedBox(height: 9.h),
                  CustomButton(
                   text: "Next",
                   icon: Icons.arrow_right_alt,
                   onPressed:(){
                    if(controller.userExist(phone)){
                      print("userExist  $phone");
                      Get.toNamed(AppRoutes.splash_phone_pre); 
                      controller.getUserInfo(phone);
                     
                    }else{
                         print("user Doesn't Exist  $phone");
                          controller.generateCode();
                          Get.toNamed(AppRoutes.splash_otp) ; 
                         
                    }
                      
                    
                  })
            ],
          ),
        ),
      ),
    );
  }
}