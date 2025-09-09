// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_task/features/auth/views/reset_password_controller.dart';

// class ResetPasswordScreen extends StatelessWidget {
//   final ResetPasswordController controller = Get.put(ResetPasswordController());

//   ResetPasswordScreen({super.key});

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
//                   "Reset Password",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 8),

//               // Subtitle
//               const Center(
//                 child: Text(
//                   "Your password must be at least 8 characters long and include a combination of letters, numbers",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // New Password
//               const Text(
//                 "New Password",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(height: 8),

//               Obx(
//                 () => TextField(
//                   controller: controller.newPasswordController,
//                   obscureText: !controller.newPasswordVisible.value,
//                   decoration: InputDecoration(
//                     hintText: "Enter new password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.newPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         controller.newPasswordVisible.value =
//                             !controller.newPasswordVisible.value;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Confirm Password
//               const Text(
//                 "Confirm New Password",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(height: 8),

//               Obx(
//                 () => TextField(
//                   controller: controller.confirmPasswordController,
//                   obscureText: !controller.confirmPasswordVisible.value,
//                   decoration: InputDecoration(
//                     hintText: "Re-enter new password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.confirmPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         controller.confirmPasswordVisible.value =
//                             !controller.confirmPasswordVisible.value;
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               // Error Message
//               Obx(
//                 () => controller.errorMessage.value.isNotEmpty
//                     ? Padding(
//                         padding: const EdgeInsets.only(top: 12),
//                         child: Text(
//                           controller.errorMessage.value,
//                           style: const TextStyle(
//                             color: Colors.red,
//                             fontSize: 14,
//                           ),
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//               ),

//               const Spacer(),

//               // Submit Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: controller.onSubmit,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     backgroundColor: Colors.blue,
//                   ),
//                   child: const Text(
//                     "Submit",
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
import 'package:test_task/features/auth/views/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  ResetPasswordScreen({super.key});

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
                  "Reset Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Center(
                child: Text(
                  "Your password must be at least 8 characters long and include a combination of letters, numbers",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),

              // New Password
              const Text(
                "New Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              Obx(
                () => CustomTextField(
                  controller: controller.newPasswordController,
                  hintText: "Enter new password",
                  obscureText: !controller.newPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.newPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.newPasswordVisible.value =
                          !controller.newPasswordVisible.value;
                    },
                  ),
                  onChanged: (_) {
                    controller.errorMessage.value = '';
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Confirm Password
              const Text(
                "Confirm New Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              Obx(
                () => CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: "Re-enter new password",
                  obscureText: !controller.confirmPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.confirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.confirmPasswordVisible.value =
                          !controller.confirmPasswordVisible.value;
                    },
                  ),
                  onChanged: (_) {
                    controller.errorMessage.value = '';
                  },
                ),
              ),

              // Error Message
              Obx(
                () => controller.errorMessage.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              const Spacer(),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.onSubmit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: AppColors.primaryBlue,
                  ),
                  child: const Text(
                    "Submit",
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
