import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/presentation/manager/device_cubit/device_cubit.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/add_device_bottom_sheet_widget.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/device_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, state) {
        if (state is DevicesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DevicesLoaded) {
          return ListView.builder(
            itemCount: state.devices.length,
            itemBuilder: (context, index) {
              final device = state.devices[index];
              return DeviceListViewItem(
                  // deviceId: device.deviceId,
                  deviceName: device.deviceName,
                  deviceType: device.deviceType,
                  price: device.price,
                  onDelete: () {
                    context.read<DeviceCubit>().deleteDevice(device.deviceId);
                  },
                  onEdit: () {
                    final TextEditingController _nameController =
                        TextEditingController(text: device.deviceName);
                    final TextEditingController _priceController =
                        TextEditingController(text: device.price.toString());

                    final List<String> _deviceTypes = [
                      'PC',
                      'PlayStation',
                      'Xbox'
                    ];

                    String _selectedDeviceType = device.deviceType;

                    editModalListView(context, _nameController, _deviceTypes,
                        _selectedDeviceType, _priceController, device);
                  });
            },
          );
        } else if (state is DeviceError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Text("wrong");
        }
      },
    );
  }

  Future<dynamic> editModalListView(
      BuildContext context,
      TextEditingController _nameController,
      List<String> _deviceTypes,
      String _selectedDeviceType,
      TextEditingController _priceController,
      DeviceModel device) {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 6,
                  width: 60,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                CustomTextfield(
                  label: 'اسم الجهاز',
                  controller: _nameController,
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
                    _selectedDeviceType = value!;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  label: 'سعر الساعة',
                  controller: _priceController,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        _priceController.text.isNotEmpty &&
                        double.tryParse(_priceController.text) != null) {
                      final updatedDevice = DeviceModel(
                        deviceId: device.deviceId,
                        deviceName: _nameController.text,
                        deviceType: _selectedDeviceType,
                        price: double.parse(_priceController.text),
                        status: device.status,
                      );

                      context.read<DeviceCubit>().editDevice(updatedDevice);

                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please enter valid data'),
                      ));
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
