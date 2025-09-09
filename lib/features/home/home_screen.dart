import 'package:flutter/material.dart';
import 'package:test_task/core/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Dummy Home Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlack,
          ),
        ),
      ),
    );
  }
}
