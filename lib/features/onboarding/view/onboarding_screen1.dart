import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/common/styles/global_text_style.dart';
import 'package:test_task/core/utils/constants/colors.dart';
import 'package:test_task/core/utils/constants/image_path.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen1 extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image section
              Expanded(
                flex: 6,
                child: Center(
                  child: Image.asset(ImagePath.onboarding1, height: 300),
                ),
              ),

              // Text Section
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      controller.pages[0].title,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlack,
                      ),
                    ),

                    const SizedBox(height: 12),
                    Text(
                      controller.pages[0].description,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        lineHeight: 1.2,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Indicator + Button
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(true),
                        const SizedBox(width: 8),
                        _buildDot(false),
                      ],
                    ),
                    Spacer(),

                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          onPressed: () => controller.nextPage(),
                          child: const Text(
                            "Next",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
