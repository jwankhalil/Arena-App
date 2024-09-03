class DeviceEntity {
  final String deviceId;
  final String deviceName;
  final String deviceType;
  final double price;
  final DeviceStatus deviceStatus;

  DeviceEntity(
      {required this.deviceId,
      required this.deviceName,
      required this.deviceType,
      required this.price,
      required this.deviceStatus});
}

enum DeviceStatus { available, reserved }
