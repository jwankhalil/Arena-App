part of 'device_cubit.dart';

@immutable
abstract class DeviceState {}

class DevicesLoading extends DeviceState {}

class DevicesLoaded extends DeviceState {
  final List<DeviceModel> devices;

  DevicesLoaded(this.devices);
}

class DeviceError extends DeviceState {
  final String message;

  DeviceError(this.message);
}
