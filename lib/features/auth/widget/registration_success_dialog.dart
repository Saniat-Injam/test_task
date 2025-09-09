import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/core/utils/constants/colors.dart';
import 'package:test_task/core/utils/constants/icon_path.dart';

class RegistrationSuccessDialog extends StatelessWidget {
  final VoidCallback onContinue;
  const RegistrationSuccessDialog({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primaryWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //const Icon(Icons.check_circle, size: 80, color: Colors.blue),
            SvgPicture.asset(IconPath.checkCircle),
            const SizedBox(height: 20),
            const Text(
              "Successfully Registered",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your account has been registered successfully, now let’s enjoy our features!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: AppColors.primaryBlue,
                ),
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
