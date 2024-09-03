import 'package:hive/hive.dart';
part 'reservation_model.g.dart';

@HiveType(typeId: 1)
class ReservationModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String deviceId;
  @HiveField(2)
  final DateTime startTime;
  @HiveField(3)
  final DateTime endTime;

  ReservationModel(
      {required this.id,
      required this.deviceId,
      required this.startTime,
      required this.endTime});

  double calculateCost(double pricePerHour) {
    final duration = endTime.difference(startTime).inMinutes / 60;
    return duration * pricePerHour;
  }
}
