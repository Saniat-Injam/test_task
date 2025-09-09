import 'package:get/get.dart';
import 'package:test_task/features/location_language/model/language_model.dart';
import 'package:test_task/routes/app_routes.dart';

class LanguageController extends GetxController {
  var languages = <LanguageModel>[
    LanguageModel(name: "English (US)", code: "en", flag: "🇺🇸"),
    LanguageModel(name: "Indonesia", code: "id", flag: "🇮🇩"),
    LanguageModel(name: "Afghanistan", code: "af", flag: "🇦🇫"),
    LanguageModel(name: "Algeria", code: "dz", flag: "🇩🇿"),
    LanguageModel(name: "Malaysia", code: "my", flag: "🇲🇾"),
    LanguageModel(name: "Arabic", code: "ar", flag: "🇦🇪"),
  ].obs;

  var selectedLanguage = "en".obs;

  void selectLanguage(String code) {
    selectedLanguage.value = code;
  }

  // void continueNext() {
  //   Get.snackbar(
  //     "Selected Language",
  //     "You selected: ${languages.firstWhere((lang) => lang.code == selectedLanguage.value).name}",
  //   );
  // }
  void continueNext() {
    final langName = languages
        .firstWhere((lang) => lang.code == selectedLanguage.value)
        .name;

    // Navigate to Home and pass selected language
    Get.toNamed(AppRoutes.homeScreen, arguments: langName);
  }
}
