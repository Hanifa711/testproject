import 'package:get/get.dart';
import 'package:myshop/bindings/product_binding.dart';
import 'package:myshop/view/screen/home/category.dart';
import 'package:myshop/view/screen/home/homepage.dart';
import 'package:myshop/view/screen/home/homescreen.dart';
import 'package:myshop/view/screen/home/more.dart';
import 'package:myshop/view/screen/home/mybag.dart';
import 'package:myshop/view/screen/auth/new_registeration_password.dart';
import 'package:myshop/view/screen/auth/product_view.dart';
import 'package:myshop/view/screen/auth/register_info.dart';
import 'package:myshop/view/screen/splash.dart';
import 'package:myshop/view/screen/auth/splash_otp.dart';
import 'package:myshop/view/screen/auth/splash_phone_login.dart';
import 'package:myshop/view/screen/auth/splash_password_login.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.splash_phone, page: () => SplashPhone()),
    GetPage(name: AppRoutes.splash_phone_pre, page: () => SplashPhonePre()),
    GetPage(name: AppRoutes.splash_otp, page: () => SplashPhoneOTP()),
    GetPage( name: AppRoutes.register_password,page: () => NewRegisterationPassword(),),
    GetPage(name: AppRoutes.register_info, page: () => RegisterationInfo()),

    // ============= Home ==================
    GetPage(name: AppRoutes.homescreen, page: () => HomeScreen()),
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    GetPage(name: AppRoutes.category, page: () => Category()),
    GetPage(name: AppRoutes.mybag, page: () => MyBag()),
    GetPage(name: AppRoutes.more, page: () => More()),

    GetPage(
      name: AppRoutes.products,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
  ];
}
