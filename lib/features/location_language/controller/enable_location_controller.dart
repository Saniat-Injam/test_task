import 'package:get/get.dart';

class EnableLocationController extends GetxController {
  void onEnablePressed() {
    Get.toNamed('/select-language');
  }

  void onSkipPressed() {
    Get.toNamed('/home');
  }
}
