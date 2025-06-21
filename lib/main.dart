import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myshop/controller/home/mybag_controller.dart';
import 'package:myshop/routes/app_pages.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/widget/background_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  Get.put(MyBagController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
          initialRoute: AppRoutes.homescreen,
          getPages: AppPages.pages,
          builder: (context, child) {
            return BackgroundWrapper(child: child);
          },
        );
      },
    );
  }
}
