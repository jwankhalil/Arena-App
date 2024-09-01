import 'package:arena_management/core/functions/show_reservation_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DeviceListViewItem extends StatelessWidget {
  const DeviceListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            Container(
              color: Colors.amber,
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            showReservationSheet(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.8,
                    blurRadius: 3,
                    offset:
                        const Offset(0, 0), // Changes position of the shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              title: Text(
                "لابتوب",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                "5400 ل س/ ساعة ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.label_outline_sharp),
              trailing: Icon(
                Icons.circle_rounded,
                color: Colors.green,
              ),

              // tileColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
