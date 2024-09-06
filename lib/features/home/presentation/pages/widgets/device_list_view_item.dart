// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arena_management/features/home/presentation/manager/device_cubit/device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:arena_management/core/functions/show_reservation_sheet.dart';
import 'package:arena_management/core/utils/app_color.dart';

import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/save_device_button.dart';

class DeviceListViewItem extends StatefulWidget {
  final String deviceId;
  final String deviceName;
  final String deviceType;
  final double price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  final int statues;
  final DateTime start;
  final DateTime end;
  const DeviceListViewItem({
    Key? key,
    required this.deviceId,
    required this.deviceName,
    required this.deviceType,
    required this.price,
    required this.onEdit,
    required this.onDelete,
    required this.statues,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  _DeviceListViewItemState createState() => _DeviceListViewItemState();
}

class _DeviceListViewItemState extends State<DeviceListViewItem> {
  bool isSessionActive = false;
  String customerName = '';
  DateTime? sessionStartTime;
  double totalCost = 0.0;

  TextEditingController customerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        key: ValueKey(widget.deviceName),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.onEdit();
              },
              backgroundColor: const Color(0xffF9E6B1),
              foregroundColor: Colors.amber,
              icon: Icons.edit_outlined,
              label: 'Edit',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.onDelete();
              },
              backgroundColor: const Color(0xffFFD8D1),
              foregroundColor: Colors.red,
              icon: Icons.delete_outlined,
              label: 'Delete',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            if (widget.statues == 1) {
              _showEndSessionDialog();
            } else {
              _startNewSession();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.8,
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                widget.deviceName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                "${widget.price} ل.س / ساعة",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: _getIconBasedOnDeviceType(),
              trailing: Icon(
                Icons.circle_rounded,
                color: widget.statues == 0 ? Colors.green : Colors.red,
                // color: isSessionActive ? Colors.red : Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startNewSession() {
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  label: 'اسم الزبون',
                  controller: customerNameController,
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
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: Text("data"),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'حدد الوقت',
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSessionActive = true;
                              customerName = customerNameController.text;
                              sessionStartTime = DateTime.now();
                            });

                            context.read<DeviceCubit>().updateDeviceStatus(
                                widget.deviceId, 1,
                                startTime: widget.start);
                          },
                          child: SaveButton(text: "بدء الجلسة")),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(18)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  "عودة ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEndSessionDialog() {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  label: 'اسم الزبون',
                  controller: TextEditingController(text: customerName),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<DeviceCubit>()
                              .updateDeviceStatus(widget.deviceId, 0);

                          Navigator.of(context).pop();
                          _endSessionAndCalculatePrice();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(18)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  "إغلاق الجلسة",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(18)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  "عودة ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _endSessionAndCalculatePrice() {
    if (widget.start != null) {
      print("${widget.start}");
      final DateTime sessionEndTime = DateTime.now();
      final Duration sessionDuration = sessionEndTime.difference(widget.start);
      final double hoursSpent = sessionDuration.inMinutes / 60;
      final double calculatedCost = hoursSpent * widget.price;

      setState(() {
        isSessionActive = false;
        totalCost = calculatedCost;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('تم إغلاق الجلسة'),
          content:
              Text('حساب الزبون: ${calculatedCost.toStringAsFixed(2)} ل.س'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('إغلاق'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("لا توجد جلسة حالية لحساب السعر."),
        ),
      );
    }
  }

  Icon _getIconBasedOnDeviceType() {
    switch (widget.deviceType) {
      case 'PC':
        return Icon(Icons.computer);
      case 'PlayStation':
        return Icon(Icons.sports_esports);
      case 'Xbox':
        return Icon(Icons.gamepad);
      default:
        return Icon(Icons.device_unknown);
    }
  }
}
