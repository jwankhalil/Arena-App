// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arena_management/core/utils/assets_data.dart';
import 'package:arena_management/features/home/presentation/manager/device_cubit/device_cubit.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/drawer_widget.dart';
import 'package:arena_management/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:arena_management/features/home/presentation/pages/widgets/add_device_bottom_sheet_widget.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/devices_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/device_model.dart';

class HomePageBody extends StatefulWidget {
  final DeviceModel? device;
  const HomePageBody({
    Key? key,
    this.device,
  }) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late String _selectedDeviceType;
  final List<String> _deviceTypes = ['PC', 'PlayStation', 'Xbox'];

  @override
  void initState() {
    super.initState();

    _nameController =
        TextEditingController(text: widget.device?.deviceName ?? '');
    _priceController =
        TextEditingController(text: widget.device?.price.toString() ?? '');
    _selectedDeviceType = widget.device?.deviceType ?? 'PC';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DrawerWidget();
            }));
          },
          child: Text(
            S.of(context).title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        forceMaterialTransparency: true,
        actions: [
          Image.asset(AssetsData.logo),
        ],
      ),
      body: const DevicesListView(),
      drawer: Drawer(child: DrawerWidget()),
      floatingActionButton: const AddDeviceBottomSheet(),
    );
  }
}
