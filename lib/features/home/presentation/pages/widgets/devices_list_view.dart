import 'package:arena_management/features/home/presentation/pages/widgets/device_list_view_item.dart';
import 'package:flutter/material.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return DeviceListViewItem(
          deviceName: "لابتوب",
          price: "5000",
          onDelete: () {},
          onEdit: () {},
        );
      },
    );
  }
}
