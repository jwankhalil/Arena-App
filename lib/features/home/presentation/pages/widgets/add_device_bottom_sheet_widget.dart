import 'package:arena_management/core/utils/app_color.dart';
import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/presentation/manager/device_cubit/device_cubit.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/save_device_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDeviceBottomSheet extends StatefulWidget {
  const AddDeviceBottomSheet({super.key});

  @override
  State<AddDeviceBottomSheet> createState() => _AddDeviceBottomSheetState();
}

class _AddDeviceBottomSheetState extends State<AddDeviceBottomSheet> {
  String _deviceName = '';
  String _selectedDeviceType = 'PC';
  String _devicePrice = '';
  final List<String> _deviceTypes = ['PC', 'PlayStation', 'Xbox'];

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController priceController = TextEditingController();

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
                    CustomTextfield(
                      label: 'اسم الجهاز',
                      controller: nameController,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'نوع الجهاز',
                        border: OutlineInputBorder(),
                      ),
                      value: _deviceTypes.contains(_selectedDeviceType)
                          ? _selectedDeviceType
                          : null,
                      items: _deviceTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDeviceType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextfield(
                      label: 'سعر الساعة',
                      controller: priceController,
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        if (nameController.text.isNotEmpty &&
                            priceController.text.isNotEmpty &&
                            double.tryParse(priceController.text) != null) {
                          final newDevice = DeviceModel(
                            deviceId: DateTime.now().toString(),
                            deviceName: nameController.text,
                            deviceType: _selectedDeviceType,
                            price: double.parse(priceController.text),
                            status: 0,
                          );

                          context.read<DeviceCubit>().addDevice(newDevice);

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter valid data')));
                        }
                      },
                      child: const SaveButton(
                        text: 'حفظ',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      backgroundColor: AppColor.primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
