import 'package:arena_management/core/functions/show_reservation_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DeviceListViewItem extends StatelessWidget {
  final String deviceName;
  final String price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DeviceListViewItem({
    super.key,
    required this.deviceName,
    required this.price,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        key: ValueKey(deviceName),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Color(0xffF9E6B1),
              foregroundColor: Colors.amber,
              icon: Icons.edit_outlined,
              label: 'Edit',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  12,
                ),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Color(0xffFFD8D1),
              foregroundColor: Colors.red,
              icon: Icons.delete_outlined,
              label: 'Delete',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(
                  12,
                ),
                bottomRight: Radius.circular(12),
              ),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => showReservationSheet(context),
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
                deviceName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                price,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: const Icon(Icons.label_outline_sharp),
              trailing: const Icon(
                Icons.circle_rounded,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
