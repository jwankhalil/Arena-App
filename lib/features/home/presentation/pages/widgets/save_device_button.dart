import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(18)),
      child: const Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'حفظ',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
