import 'package:arena_management/core/utils/app_color.dart';
import 'package:arena_management/features/home/presentation/manager/lacale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Language",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select Language",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.teal.shade700,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                context.read<LocaleCubit>().toEnglish();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor, // Background color
                textStyle: TextStyle(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              icon: Icon(Icons.language, size: 24),
              label: Text(
                'Switch to English',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                context.read<LocaleCubit>().toArabic();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor, // Background color
                textStyle: TextStyle(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              icon: Icon(Icons.language, size: 24),
              label: Text(
                'التبديل إلى العربية',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
