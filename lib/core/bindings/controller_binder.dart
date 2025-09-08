import 'package:get/get.dart';
import 'package:test_task/features/splash_screen/controller/splash_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
