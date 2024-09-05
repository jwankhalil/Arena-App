import 'package:arena_management/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      GoRouter.of(context).push('/homePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(height: 200, child: Image.asset(AssetsData.logo)),
        const Text(
          "Arena Management",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
