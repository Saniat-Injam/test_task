import 'package:get/get.dart';
import 'package:test_task/core/utils/constants/image_path.dart';
import '../model/onboarding_model.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  final pages = [
    OnboardingModel(
      title: "Best online courses\nin the world",
      description:
          "Now you can learn anywhere, anytime, even if there is no internet access!",
      image: ImagePath.onboarding1,
    ),
    OnboardingModel(
      title: "Explore Your New Skill Today",
      description:
          "Our Platform is designed to help you explore new skills. Let's learn & grow with Eduline!",
      image: ImagePath.onboarding2,
    ),
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      currentPage.value++;
      Get.toNamed(AppRoutes.onboarding2);
    } else {
      // Go to home/dashboard after onboarding
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
