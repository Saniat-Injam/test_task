// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_task/core/utils/constants/colors.dart';
// import 'package:test_task/core/utils/constants/image_path.dart';
// import 'package:test_task/features/auth/controllers/login_controller.dart';
// import 'package:test_task/features/auth/views/forgot_password_screen.dart';

// class LoginScreen extends StatelessWidget {
//   final LoginController controller = Get.put(LoginController());

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: controller.formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 80),

//               // Logo Icon
//               Image.asset(ImagePath.bulb, height: 70, width: 70),
//               const SizedBox(height: 20),

//               const Text(
//                 "Welcome Back!",
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "Please login first to start your Theory Test.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 40),

//               // Email
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Email Address",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: controller.emailController,
//                 decoration: const InputDecoration(
//                   hintText: "Enter your email",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(100)),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter email";
//                   }
//                   if (!GetUtils.isEmail(value)) return "Enter valid email";
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),

//               // Password
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Password",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Obx(
//                 () => TextFormField(
//                   controller: controller.passwordController,
//                   obscureText: !controller.isPasswordVisible.value,
//                   decoration: InputDecoration(
//                     hintText: "Enter password",
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(100)),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.isPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: controller.togglePasswordVisibility,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter password";
//                     }
//                     if (value.length < 8) {
//                       return "Password must be at least 8 characters";
//                     }
//                     if (!RegExp(r'[A-Z]').hasMatch(value)) {
//                       return "Must contain uppercase";
//                     }
//                     if (!RegExp(r'[a-z]').hasMatch(value)) {
//                       return "Must contain lowercase";
//                     }
//                     if (!RegExp(r'[0-9]').hasMatch(value)) {
//                       return "Must contain number";
//                     }
//                     if (!RegExp(r'[!@#\$&*~%^.,?_-]').hasMatch(value)) {
//                       return "Must contain special character";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // Remember Me + Forgot Password
//               Row(
//                 children: [
//                   Obx(
//                     () => Checkbox(
//                       value: controller.rememberMe.value,
//                       onChanged: controller.toggleRememberMe,
//                       activeColor: AppColors.primaryBlue,
//                     ),
//                   ),
//                   const Text("Remember Me"),
//                   const Spacer(),
//                   TextButton(
//                     onPressed: () {
//                       Get.to(() => ForgotPasswordScreen());
//                     },
//                     child: const Text(
//                       "Forgot Password",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Sign In Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: controller.login,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     backgroundColor: AppColors.primaryBlue,
//                   ),
//                   child: const Text("Sign In", style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Create Account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("New to Theory Test? "),
//                   SizedBox(width: 4),
//                   GestureDetector(
//                     onTap: controller.goToRegister,
//                     child: Text(
//                       "Create Account",
//                       style: TextStyle(
//                         color: AppColors.primaryBlue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
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
import 'package:test_task/core/utils/constants/image_path.dart';
import 'package:test_task/features/auth/controllers/login_controller.dart';
import 'package:test_task/features/auth/views/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              // Logo Icon
              Image.asset(ImagePath.bulb, height: 70, width: 70),
              const SizedBox(height: 20),

              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please login first to start your Theory Test.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Email
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: controller.emailController,
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  if (!GetUtils.isEmail(value)) return "Enter valid email";
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Enter password",
                  obscureText: !controller.isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return "Must contain uppercase";
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return "Must contain lowercase";
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return "Must contain number";
                    }
                    if (!RegExp(r'[!@#\$&*~%^.,?_-]').hasMatch(value)) {
                      return "Must contain special character";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),

              // Remember Me + Forgot Password
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: controller.toggleRememberMe,
                      activeColor: AppColors.primaryBlue,
                    ),
                  ),
                  const Text("Remember Me"),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: AppColors.primaryBlue,
                  ),
                  child: const Text("Sign In", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),

              // Create Account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New to Theory Test? "),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: controller.goToRegister,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
