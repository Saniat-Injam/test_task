import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_task/core/utils/constants/colors.dart';
import 'package:test_task/core/utils/constants/icon_path.dart';
import 'package:test_task/features/auth/views/login_screen.dart';

class OtpSuccessDialog extends StatelessWidget {
  const OtpSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primaryWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(IconPath.checkMulti),
            const SizedBox(height: 20),

            const Text(
              "Success",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text(
              "Your password is successfully created",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
