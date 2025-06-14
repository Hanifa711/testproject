import 'package:get/get.dart';
import 'package:myshop/bindings/product_binding.dart';
import 'package:myshop/view/screen/new_registeration_password.dart';
import 'package:myshop/view/screen/product_view.dart';
import 'package:myshop/view/screen/register_info.dart';
import 'package:myshop/view/screen/splash.dart';
import 'package:myshop/view/screen/splash_otp.dart';
import 'package:myshop/view/screen/splash_phone_login.dart';
import 'package:myshop/view/screen/splash_password_login.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
     GetPage(name:AppRoutes.splash, page: () => const SplashScreen()),
     GetPage(name:AppRoutes.splash_phone, page: () =>  SplashPhone()),
     GetPage(name:AppRoutes.splash_phone_pre, page: () =>  SplashPhonePre()),
     GetPage(name:AppRoutes.splash_otp, page: () =>  SplashPhoneOTP()),
     GetPage(name:AppRoutes.register_password, page: () =>  NewRegisterationPassword()),
    GetPage(name:AppRoutes.register_info, page: () =>  RegisterationInfo()),




    GetPage(
      name: AppRoutes.products,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
  ];
}
