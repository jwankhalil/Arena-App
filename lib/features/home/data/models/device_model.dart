import 'package:hive/hive.dart';
part 'device_model.g.dart';

@HiveType(typeId: 0)
class DeviceModel extends HiveObject {
  @HiveField(0)
  final String deviceId;
  @HiveField(1)
  final String deviceName;
  @HiveField(2)
  final String deviceType;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final int status;

  DeviceModel(
      {required this.deviceId,
      required this.deviceName,
      required this.deviceType,
      required this.price,
      required this.status});

  bool isAvailable() => status == 0;
}
