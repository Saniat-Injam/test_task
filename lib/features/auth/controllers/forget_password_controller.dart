import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final emailError = RxString('');

  /// Email Validation
  bool validateEmail() {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = "Email is required";
      return false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = "Enter a valid email";
      return false;
    }
    emailError.value = "";
    return true;
  }

  /// Continue button action
  void onContinue() {
    if (validateEmail()) {
      // Navigate to reset password screen
      Get.toNamed(AppRoutes.resetPassword);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
