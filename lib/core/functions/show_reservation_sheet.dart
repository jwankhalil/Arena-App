import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/save_device_button.dart';
import 'package:flutter/material.dart';

Future<dynamic> showReservationSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 6,
                width: 60,
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              // const CustomTextfield(label: 'اسم الزبون'),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors
                                .green, // Header background color and active selector color
                            onPrimary: Colors
                                .white, // Text color inside the header (AM/PM text)
                            onSurface:
                                Colors.black, // Body text color (time digits)
                          ),
                          dialogBackgroundColor: Colors
                              .white, // Background color of the picker dialog
                        ),
                        child: child!,
                      );
                    },
                  );
                },
                child: Text(
                  ":حدد الوقت",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 24),
              const SaveButton(
                text: 'ffff',
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
