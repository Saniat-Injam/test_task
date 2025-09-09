import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/features/auth/views/login_screen.dart';
import 'package:test_task/features/auth/widget/registration_success_dialog.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var passwordStrength = 0.0.obs;
  var passwordLabel = "Very Weak".obs;

  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// ✅ Strong password rules:
  /// - At least 8 characters
  /// - 1 uppercase
  /// - 1 lowercase
  /// - 1 number
  /// - 1 special character
  void checkPasswordStrength(String password) {
    int strength = 0;

    if (password.length >= 8) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[a-z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[!@#\$&*~%^.,?_-]').hasMatch(password)) strength++;

    passwordStrength.value = (strength / 5);

    switch (strength) {
      case 0:
      case 1:
        passwordLabel.value = "Very Weak";
        break;
      case 2:
        passwordLabel.value = "Weak";
        break;
      case 3:
        passwordLabel.value = "Medium";
        break;
      case 4:
        passwordLabel.value = "Strong";
        break;
      case 5:
        passwordLabel.value = "Very Strong";
        break;
    }
  }

  void register() {
    if (formKey.currentState!.validate()) {
      // Simulate API call success
      Get.dialog(
        RegistrationSuccessDialog(
          onContinue: () {
            Get.offAll(() => LoginScreen());
          },
        ),
        barrierDismissible: false,
      );
    }
  }
}
