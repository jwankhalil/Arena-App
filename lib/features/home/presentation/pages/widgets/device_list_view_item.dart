// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:arena_management/core/functions/show_reservation_sheet.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/custom_text_field.dart';
import 'package:arena_management/features/home/presentation/pages/widgets/save_device_button.dart';

class DeviceListViewItem extends StatefulWidget {
  final String deviceName;
  final double price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DeviceListViewItem({
    Key? key,
    required this.deviceName,
    required this.price,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  _DeviceListViewItemState createState() => _DeviceListViewItemState();
}

class _DeviceListViewItemState extends State<DeviceListViewItem> {
  bool isSessionActive = false;
  String customerName = '';
  DateTime? sessionStartTime; // Store session start time
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
            if (isSessionActive) {
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
                  offset: const Offset(0, 0), // Changes position of the shadow
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
              leading: const Icon(Icons.label_outline_sharp),
              trailing: Icon(
                Icons.circle_rounded,
                color: isSessionActive
                    ? Colors.red
                    : Colors.green, // Change color based on session status
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to start a new session
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
                  controller: customerNameController,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("عودة"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSessionActive = true;
                          customerName = customerNameController.text;
                          sessionStartTime =
                              DateTime.now(); // Start the session time
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("بدء الجلسة"),
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

  // Method to show the session end dialog
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
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("عودة"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _endSessionAndCalculatePrice();
                      },
                      child: const Text("إغلاق الجلسة"),
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

  // Method to end the session and calculate the price
  void _endSessionAndCalculatePrice() {
    if (sessionStartTime != null) {
      final DateTime sessionEndTime = DateTime.now();
      final Duration sessionDuration =
          sessionEndTime.difference(sessionStartTime!);
      final double hoursSpent = sessionDuration.inMinutes / 60;
      final double calculatedCost = hoursSpent * widget.price;

      setState(() {
        isSessionActive = false;
        totalCost = calculatedCost;
        sessionStartTime = null;
      });

      // Show the cost in a dialog
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
}
