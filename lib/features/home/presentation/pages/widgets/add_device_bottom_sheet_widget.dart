import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/save_device_button.dart';
import 'package:flutter/material.dart';

class AddDeviceBottomSheet extends StatefulWidget {
  const AddDeviceBottomSheet({super.key});

  @override
  State<AddDeviceBottomSheet> createState() => _AddDeviceBottomSheetState();
}

class _AddDeviceBottomSheetState extends State<AddDeviceBottomSheet> {
  String? _selectedDeviceType; // Holds the selected value from the dropdown
  final List<String> _deviceTypes = ['PC', 'Laptop', 'Console'];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
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
                    const CustomTextfield(label: 'اسم الجهاز'),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'نوع الجهاز',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedDeviceType,
                      items: _deviceTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDeviceType = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const CustomTextfield(
                      label: 'سعر الساعة',
                    ),
                    const SizedBox(height: 24),
                    const SaveButton(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      backgroundColor: Colors.green,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
