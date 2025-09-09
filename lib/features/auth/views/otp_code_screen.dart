import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/features/auth/controllers/otp_code_controller.dart';

class OtpCodeScreen extends StatelessWidget {
  final OtpCodeController controller = Get.put(OtpCodeController());

  OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Verify Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter the code we just sent to\nemail pristia@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60,
                    child: TextField(
                      controller: controller
                          .textControllers[index], // <-- bind controller
                      focusNode: controller.focusNodes[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) =>
                          controller.onOtpChanged(value, index),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Obx(() {
                int minutes = controller.timer.value ~/ 60;
                int seconds = controller.timer.value % 60;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.timer.value > 0
                          ? "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"
                          : "Didn't receive code?",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: controller.timer.value == 0
                            ? controller.resendCode
                            : null,
                        child: const Text("Resend Code"),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
