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

              // OTP input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60,
                    child: TextField(
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
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.otp.value += value;
                          if (controller.otp.value.length == 4) {
                            controller.onOtpCompleted(controller.otp.value);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Resend code in 00:48",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),

              // Numeric keypad like in your design (optional)
              GridView.builder(
                shrinkWrap: true,
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  if (index == 9) return const SizedBox();
                  if (index == 11) {
                    return IconButton(
                      onPressed: () {
                        if (controller.otp.value.isNotEmpty) {
                          controller.otp.value = controller.otp.value.substring(
                            0,
                            controller.otp.value.length - 1,
                          );
                        }
                      },
                      icon: const Icon(Icons.backspace_outlined),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () {
                      String value = (index == 10) ? "0" : "${index + 1}";
                      if (controller.otp.value.length < 4) {
                        controller.otp.value += value;
                        if (controller.otp.value.length == 4) {
                          controller.onOtpCompleted(controller.otp.value);
                        }
                      }
                    },
                    child: Text(
                      (index == 10) ? "0" : "${index + 1}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
