import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/domain/repos/device_repo.dart';
import 'package:hive/hive.dart';

class DeviceRepoImpl extends DeviceRepo {
  final Box<DeviceModel> deviceBox;

  DeviceRepoImpl({required this.deviceBox});

  @override
  Future<List<DeviceModel>> getDevices() async {
    return deviceBox.values.toList();
  }

  @override
  Future<void> addDevice(DeviceModel device) async {
    await deviceBox.put(device.deviceId, device);
  }

  // @override
  // Future<void> deleteDevice(String id) async {
  //   await deviceBox.delete(id);
  // }

  @override
  Future<void> deleteDevice(String deviceId) async {
    final deviceKey = deviceBox.keys.firstWhere((key) {
      final device = deviceBox.get(key);
      return device?.deviceId == deviceId;
    }, orElse: () => null);

    if (deviceKey != null) {
      await deviceBox.delete(deviceKey);
    }
  }

  @override
  Future<void> editDevice(DeviceModel updatedDevice) async {
    final deviceKey = deviceBox.keys.firstWhere((key) {
      final device = deviceBox.get(key);
      return device?.deviceId == updatedDevice.deviceId;
    }, orElse: () => null);

    if (deviceKey != null) {
      await deviceBox.put(deviceKey, updatedDevice);
    }
  }
}
