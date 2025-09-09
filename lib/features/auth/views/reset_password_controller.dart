import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var newPasswordVisible = false.obs;
  var confirmPasswordVisible = false.obs;

  final errorMessage = RxString('');

  /// Password validation
  bool validatePassword(String password) {
    if (password.length < 8) return false;
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    if (!password.contains(RegExp(r'[0-9]'))) return false;
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }

  void onSubmit() {
    String newPass = newPasswordController.text.trim();
    String confirmPass = confirmPasswordController.text.trim();

    if (!validatePassword(newPass)) {
      errorMessage.value =
          "Password must be at least 8 chars, include uppercase, lowercase, number & special char";
      return;
    }

    if (newPass != confirmPass) {
      errorMessage.value = "Passwords do not match";
      return;
    }

    errorMessage.value = "";

    // Navigate to verify code screen
    Get.toNamed(AppRoutes.otpCodeScreen);
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
