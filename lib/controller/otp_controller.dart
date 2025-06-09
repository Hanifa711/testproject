import 'package:get/get.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;

  void verifyCode(String code) {
    otpCode.value = code;
    print("Verifying OTP: $code");
    // Add your verification logic here
  }
}
