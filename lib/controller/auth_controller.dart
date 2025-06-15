import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:myshop/core/services/local_storage_service.dart';
import 'package:myshop/data/model/user_model.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/screen/auth/splash_phone_login.dart';

class AuthController extends GetxController {
  final storage = StorageService();
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  final RxString generatedCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initSettings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(initSettings);
  }

  void _showLocalNotification(String code) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'otp_channel', 'OTP Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(
      0,
      'Your OTP Code',
      'Verification Code: $code',
      platformDetails,
    );
  }

  /// Generates a 6-digit OTP
  void generateCode() {
    final random = Random();
    generatedCode.value = List.generate(5, (_) => random.nextInt(10)).join();
    _showLocalNotification(generatedCode.value);
  }

  /// Registration flow
  void register({
  required String name,
  required String phone,
  required String password,
  List<String>? addresses,
  String? image,
}) {
  if (storage.userExists(phone)) {
    Get.snackbar('Error', 'User already exists');
    return;
  }

  final user = UserModel(
    name: name,
    phone: phone,
    password: password,
    addresses: addresses,
    image: image,
  );

  storage.saveUser(user);
  Get.snackbar('Success', 'Registered. Check your notification for the code.');
}


  /// Login flow
  void login(String phone, String password) {
    final user = storage.getUser(phone);
    getUserInfo(phone);
    if (user == null) {
      Get.snackbar('Error', 'User not found');
    } else if (user.password != password) {
      Get.snackbar('Error', 'Incorrect password');
    } else {
      Get.snackbar('Welcome', 'Hello ${user.name}');
      // Navigate to home
      Get.toNamed(AppRoutes.homescreen);
    }
  }

  /// Verifies code manually
  bool verifyCode(String inputCode) {
    return inputCode == generatedCode.value;
  }

   bool userExist(String phone){
     final user = storage.getUser(phone);
     if (user == null) {
      return false;
    }
    return true;  
   }

   void updatePassword(UserModel newUser){
   // var currentUser= storage.getUser(newUser.phone!);

    final user = UserModel(
    name: newUser.name,
    phone: newUser.phone,
    password: newUser.password,
  );
    storage.saveUser(user);
    Get.snackbar("Note", "Updated successfuly");
    Get.toNamed(AppRoutes.products);
   }

   void getUserInfo(String phone){
    var user = storage.getUser(phone);
    if(user!=null){
      userModel.name=user.name;
      userModel.phone=user.phone;
      userModel.password=user.password;
      userModel.addresses=user.addresses;
      userModel.image=user.image;
    }
   }
}
