// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';

// class FacebookController extends GetxController {
//   Rxn<Map<String, dynamic>> userData = Rxn<Map<String, dynamic>>();

//   Future<void> loginWithFacebook() async {
//     final result = await FacebookAuth.instance.login(); // request permissions
//     if (result.status == LoginStatus.success) {
//       final userInfo = await FacebookAuth.instance.getUserData(
//         fields: "name,email,picture.width(200)",
//       );
//       userData.value = userInfo;
//     } else {
//       Get.snackbar('Login Failed', result.message ?? 'Unknown error');
//     }
//   }

//   Future<void> logout() async {
//     await FacebookAuth.instance.logOut();
//     userData.value = null;
//   }
// }
