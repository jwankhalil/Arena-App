import 'package:arena_management/core/utils/app_color.dart';
import 'package:arena_management/features/home/splash/presentation/pages/widgets/splash_page_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SplashPageBody(),
    );
  }
}
