// password_controller.dart
import 'package:get/get.dart';

class ConfirmPasswordController extends GetxController {
  var isObscure = true.obs;
 void toggle() => isObscure.value = !isObscure.value;
}
