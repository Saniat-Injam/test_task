import 'package:get/get.dart';
import 'package:test_task/features/splash_screen/screen/splash_screen.dart';

class AppRoute {
  //static String loginScreen = "/loginScreen";
  static String splashScreen = "/splashScreen";

  //static String getLoginScreen() => loginScreen;
  static String getSplashScreen() => splashScreen;

  static List<GetPage> routes = [
    //GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
  ];
}
