import 'package:get/get.dart';
import 'package:test_task/features/onboarding/view/onboarding_screen1.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    //Get.offAllNamed('/onBoardingScreen');
    //Get.offAllNamed(AppRoute.onBoardingScreen); // safer than hardcoding
    Get.offAll(() => OnboardingScreen1());
  }
}
