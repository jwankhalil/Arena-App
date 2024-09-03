import 'package:arena_management/features/home/data/models/device_model.dart';

abstract class DeviceRepo {
  Future<List<DeviceModel>> getDevices();
  Future<void> addDevice(DeviceModel device);
  Future<void> deleteDevice(String id);
  Future<void> editDevice(DeviceModel device);
}
