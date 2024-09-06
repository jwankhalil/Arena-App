// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:arena_management/features/home/domain/repos/device_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/add_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/delete_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/edit_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/get_devices_use_case.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final GetDevicesUseCase getDevicesUseCase;
  final AddDeviceUseCase addDeviceUseCase;
  final DeleteDeviceUseCase deleteDeviceUseCase;
  final EditDeviceUseCase editDeviceUseCase;
  final DeviceRepo deviceRepo;
  DeviceCubit(this.getDevicesUseCase, this.addDeviceUseCase,
      this.deleteDeviceUseCase, this.editDeviceUseCase, this.deviceRepo)
      : super(DevicesLoading());

  void loadDevices() async {
    emit(DevicesLoading());
    try {
      final devices = await getDevicesUseCase();
      emit(DevicesLoaded(devices));
    } catch (e) {
      emit(DeviceError('Failed to load devices'));
    }
  }

  void addDevice(DeviceModel device) async {
    await addDeviceUseCase(device);
    loadDevices();
  }

  void deleteDevice(String deviceId) async {
    await deleteDeviceUseCase(deviceId);
    loadDevices();
  }

  void editDevice(DeviceModel updatedDevice) async {
    await editDeviceUseCase(updatedDevice);
    loadDevices();
  }

  // Future<void> updateDeviceStatus(String deviceId, int newStatus) async {
  //   try {
  //     final devices = await deviceRepo.getDevices();
  //     final device = devices.firstWhere((d) => d.deviceId == deviceId);

  //     final updatedDevice = DeviceModel(
  //       deviceId: device.deviceId,
  //       deviceName: device.deviceName,
  //       deviceType: device.deviceType,
  //       price: device.price,
  //       status: newStatus,
  //     );

  //     await deviceRepo.editDevice(updatedDevice);

  //     final updatedDevices = await deviceRepo.getDevices();
  //     emit(DevicesLoaded(updatedDevices));
  //   } catch (e) {
  //     emit(DeviceError("Failed to update device status"));
  //   }
  // }

  Future<void> updateDeviceStatus(String deviceId, int newStatus,
      {DateTime? startTime}) async {
    try {
      final devices = await deviceRepo.getDevices();
      final device = devices.firstWhere((d) => d.deviceId == deviceId);

      final updatedDevice = DeviceModel(
        deviceId: device.deviceId,
        deviceName: device.deviceName,
        deviceType: device.deviceType,
        price: device.price,
        status: newStatus,
        startTime: startTime ?? device.startTime,
      );

      await deviceRepo.editDevice(updatedDevice);

      final updatedDevices = await deviceRepo.getDevices();
      emit(DevicesLoaded(updatedDevices));
    } catch (e) {
      emit(DeviceError("Failed to update device status"));
    }
  }
}
