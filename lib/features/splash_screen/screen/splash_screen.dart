import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/utils/constants/image_path.dart';
import 'package:test_task/features/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Car + cloud illustration
              Image.asset(ImagePath.car, height: 124, width: 124),
              const SizedBox(height: 20),

              // Title
              const Text(
                "Theory test in my language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "I must write the real test will be in English language "
                  "and this app just helps you to understand the materials "
                  "in your language",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              // Loader
              const CircularProgressIndicator(color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
