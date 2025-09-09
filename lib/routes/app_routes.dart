import 'package:get/get.dart';
import 'package:test_task/features/auth/views/forgot_password_screen.dart';
import 'package:test_task/features/auth/views/otp_code_screen.dart';
import 'package:test_task/features/auth/views/register_screen.dart';
import 'package:test_task/features/auth/views/reset_password_screen.dart';
import 'package:test_task/features/home/home_screen.dart';
import 'package:test_task/features/location_language/views/enable_location_screen.dart';
import 'package:test_task/features/location_language/views/select_language_screen.dart';
import 'package:test_task/features/onboarding/view/onboarding_screen1.dart';
import 'package:test_task/features/onboarding/view/onboarding_screen2.dart';
import 'package:test_task/features/splash_screen/screen/splash_screen.dart';

class AppRoutes {
  //static String loginScreen = "/loginScreen";
  static String splashScreen = "/splashScreen";
  static const onboarding1 = '/onboarding1';
  static const onboarding2 = '/onboarding2';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const resetPassword = '/reset-password';
  static const otpCodeScreen = '/otp-code';
  static const enableLocation = '/enable-location';
  static const homeScreen = '/home';
  static const selectLanguageScreen = '/select-language';

  //static String getLoginScreen() => loginScreen;
  static String getSplashScreen() => splashScreen;

  static List<GetPage> routes = [
    //GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboarding1, page: () => OnboardingScreen1()),
    GetPage(name: onboarding2, page: () => OnboardingScreen2()),
    GetPage(name: register, page: () => RegisterScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: otpCodeScreen, page: () => OtpCodeScreen()),
    GetPage(name: enableLocation, page: () => EnableLocationView()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: selectLanguageScreen, page: () => SelectLanguageScreen()),
  ];
}
