// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  DeviceCubit(
    this.getDevicesUseCase,
    this.addDeviceUseCase,
    this.deleteDeviceUseCase,
    this.editDeviceUseCase,
  ) : super(DevicesLoading());

  // This method loads the devices and emits new states.
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
    await addDeviceUseCase(device); // Add the device to the repository
    loadDevices(); // Reload the list to reflect the new addition
  }

  void deleteDevice(String deviceId) async {
    await deleteDeviceUseCase(deviceId);
    loadDevices();
  }

  void editDevice(DeviceModel updatedDevice) async {
    await editDeviceUseCase(updatedDevice);
    loadDevices();
  }
}
