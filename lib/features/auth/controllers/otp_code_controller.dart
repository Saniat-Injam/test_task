import 'package:get/get.dart';
import 'package:test_task/features/auth/widget/otp_success_dialog.dart';

class OtpCodeController extends GetxController {
  var otp = "".obs;

  void onOtpCompleted(String value) {
    otp.value = value;
    // Show dialog when OTP is completed
    Get.dialog(const OtpSuccessDialog());
  }
}
