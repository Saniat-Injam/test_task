import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/utils/constants/image_path.dart';
import 'package:test_task/features/location_language/controller/enable_location_controller.dart';

class EnableLocationView extends GetView<EnableLocationController> {
  const EnableLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Map Icon
                Image.asset(ImagePath.map, height: 120, width: 120),
                const SizedBox(height: 30),

                // Title
                const Text(
                  "Enable Location",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  "Kindly allow us to access your location to provide you with suggestions for nearby salons",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // Enable Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: controller.onEnablePressed,
                    child: const Text(
                      "Enable",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Skip Button
                GestureDetector(
                  onTap: controller.onSkipPressed,
                  child: const Text(
                    "Skip, Not Now",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
