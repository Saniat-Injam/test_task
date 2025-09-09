import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/features/auth/views/register_screen.dart';
import 'package:test_task/features/location_language/views/enable_location_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  var rememberMe = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.to(() => EnableLocationView());
    }
  }

  void goToRegister() {
    Get.to(() => RegisterScreen());
  }
}
