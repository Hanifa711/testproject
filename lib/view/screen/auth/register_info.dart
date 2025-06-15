import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/auth_controller.dart';
import 'package:myshop/controller/image_controller.dart';
import 'package:myshop/core/functions/pick_image.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/screen/auth/splash_phone_login.dart';
import 'package:myshop/view/widget/custom_button.dart';
import 'package:myshop/view/widget/custom_textfield.dart';

class RegisterationInfo extends StatelessWidget {
  final TextEditingController name_controller=TextEditingController();
  final AuthController controller = Get.put(AuthController());
  final ImageController image_controller = Get.put(ImageController());
  RegisterationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Your Information",style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
      ),
      body:Container(
        padding:EdgeInsets.fromLTRB(11.w, 25.h, 11.w, 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("It looks like you don’t have account in this number. Please let us know some information for a scure service",
               style:TextStyle(fontSize: 14.sp),
                  ),
                SizedBox(height:20.h,), 
                  Center(child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 70.sp,
                    child: IconButton(
                      onPressed:() {
                        pickImageView();
                    },
                     icon:Obx(() {
                        if (image_controller.pickedImage.value != null) {
                          return Image.file(image_controller.pickedImage.value!, height: 150);
                        } else {
                          return Icon(Icons.add_a_photo_outlined,color: Colors.black,size:50.sp,);
                        }
                      })
                      ),
                  )),
                  SizedBox(height: 46.h),
                   CustomButton(
                   text: "Sync From Facebook",
                   icon: Icons.facebook,
                   color: Colors.blue,
                   onPressed:(){}),
                    SizedBox(height: 18.h),
                  CustomTextField(
                  controller: name_controller,
                  label: "Full Name",
                  preicon: Icon(Icons.person_outline),
                  onChanged: (name) {
                     userModel.name=name;
                  },
                  ),
                   SizedBox(height: 200.h),
                  CustomButton(
                   text: "Next",
                   icon: Icons.arrow_right_alt,
                   onPressed:(){
                    if(userModel.name!=null && userModel.phone !=null && userModel.password !=null){
                      controller.register(
                      name: userModel.name!, 
                      phone: userModel.phone!,
                      password: userModel.password!);
                    }

                    if(controller.userExist(userModel.phone!)){
                       Get.toNamed(AppRoutes.homescreen);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}