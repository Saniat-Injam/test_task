import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:test_task/core/common/styles/global_text_style.dart';
import 'package:test_task/core/utils/constants/colors.dart';
import 'package:test_task/core/utils/constants/image_path.dart';
import 'package:test_task/features/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.15),

                // Car + cloud illustration
                Image.asset(ImagePath.car, height: 124, width: 124),
                const SizedBox(height: 20),

                // Title
                Text(
                  "Theory test in my language",
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlack,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "I must write the real test will be in English"
                    "language and this app just helps you to"
                    "understand the materials in your"
                    "language",
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),

                // Loader
                // const CircularProgressIndicator(
                //   color: AppColors.primaryBlue,
                //   strokeWidth: 6,
                // ),
                SpinKitCircle(color: AppColors.primaryBlue, size: 50.0),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
