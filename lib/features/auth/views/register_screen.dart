import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/features/auth/controllers/register_controller.dart';
import 'package:test_task/features/auth/views/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Welcome to Eduline",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Email
              const Text("Email Address"),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  if (!GetUtils.isEmail(value)) return "Enter valid email";
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Name
              const Text("Full Name"),
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  hintText: "Enter your full name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter full name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password
              const Text("Password"),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  onChanged: controller.checkPasswordStrength,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return "Password must contain an uppercase letter";
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return "Password must contain a lowercase letter";
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return "Password must contain a number";
                    }
                    if (!RegExp(r'[!@#\$&*~%^.,?_-]').hasMatch(value)) {
                      return "Password must contain a special character";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Password strength indicator (progress + label in same row)
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: controller.passwordStrength.value,
                        minHeight: 4,
                        backgroundColor: Colors.grey[300],
                        color: controller.passwordStrength.value > 0.8
                            ? Colors.blue
                            : controller.passwordStrength.value > 0.5
                            ? Colors.orange
                            : Colors.red,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      controller.passwordLabel.value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: controller.passwordStrength.value > 0.8
                            ? Colors.blue
                            : controller.passwordStrength.value > 0.5
                            ? Colors.orange
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "At least 8 characters with a combination of letters and numbers",
                      style: TextStyle(color: Colors.green, fontSize: 13),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Register Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Register", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),

              // Sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => Get.to(() => LoginScreen()),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
