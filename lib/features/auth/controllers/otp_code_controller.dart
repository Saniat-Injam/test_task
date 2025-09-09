import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/features/auth/widget/otp_success_dialog.dart';

class OtpCodeController extends GetxController {
  var otp = ''.obs;
  RxInt timer = 120.obs;
  Timer? countdownTimer;

  // Focus nodes for each text field
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  // Text editing controllers for each field
  final List<TextEditingController> textControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer.value = 120;
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (
      timerInstance,
    ) {
      if (timer.value > 0) {
        timer.value--;
      } else {
        countdownTimer?.cancel();
      }
    });
  }

  void onOtpChanged(String value, int index) {
    // Update otp value from textControllers
    otp.value = textControllers.map((c) => c.text).join();

    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    // Trigger success dialog when 4 digits entered
    if (otp.value.length == 4) {
      onOtpCompleted(otp.value);
    }
  }

  void onOtpCompleted(String value) {
    Get.dialog(
      const OtpSuccessDialog(),
      barrierDismissible: false, // User cannot dismiss by tapping outside
    );
  }

  void resendCode() {
    otp.value = '';
    for (var controller in textControllers) {
      controller.clear(); // <-- Clear text fields
    }
    focusNodes[0].requestFocus();
    startTimer();
    // Call resend API here
  }
}
