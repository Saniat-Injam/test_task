// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_task/features/auth/controllers/forget_password_controller.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   final ForgotPasswordController controller = Get.put(
//     ForgotPasswordController(),
//   );

//   ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Back Button
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => Get.back(),
//               ),
//               const SizedBox(height: 20),

//               // Title
//               const Center(
//                 child: Text(
//                   "Forgot Password",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 8),

//               // Subtitle
//               const Center(
//                 child: Text(
//                   "Enter your email, we will send a verification code to email",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Email Label
//               const Text(
//                 "Email Address",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(height: 8),

//               // Email Input
//               TextField(
//                 controller: controller.emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: "example@gmail.com",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//               ),

//               // Error Message
//               Obx(
//                 () => controller.emailError.value.isNotEmpty
//                     ? Padding(
//                         padding: const EdgeInsets.only(top: 8),
//                         child: Text(
//                           controller.emailError.value,
//                           style: const TextStyle(
//                             color: Colors.red,
//                             fontSize: 14,
//                           ),
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//               ),

//               const Spacer(),

//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: controller.onContinue,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     backgroundColor: Colors.blue,
//                   ),
//                   child: const Text(
//                     "Continue",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/common/widgets/custom_text_field.dart';
import 'package:test_task/core/utils/constants/colors.dart';
import 'package:test_task/features/auth/controllers/forget_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 20),

              // Title
              const Center(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Center(
                child: Text(
                  "Enter your email, we will send a verification code to email",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),

              // Email Label
              const Text(
                "Email Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // Custom Email Input
              Obx(
                () => CustomTextField(
                  controller: controller.emailController,
                  hintText: "example@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    controller.emailError.value = ''; // clear error on change
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  suffixIcon: controller.emailError.value.isNotEmpty
                      ? const Icon(Icons.error, color: Colors.red)
                      : null,
                ),
              ),

              // Error Message
              Obx(
                () => controller.emailError.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          controller.emailError.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.onContinue,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: AppColors.primaryBlue,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
