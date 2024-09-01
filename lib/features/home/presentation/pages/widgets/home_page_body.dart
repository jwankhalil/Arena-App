import 'package:arena_management/features/home/presentation/pages/widgets/add_device_bottom_sheet_widget.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/devices_list_view.dart';

import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الأجهزة",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: const DevicesListView(),
      floatingActionButton: const AddDeviceBottomSheet(),
    );
  }
}
