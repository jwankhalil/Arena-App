// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceModelAdapter extends TypeAdapter<DeviceModel> {
  @override
  final int typeId = 0;

  @override
  DeviceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceModel(
      deviceId: fields[0] as String,
      deviceName: fields[1] as String,
      deviceType: fields[2] as String,
      price: fields[3] as double,
      status: fields[4] as int,
      startTime: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.deviceId)
      ..writeByte(1)
      ..write(obj.deviceName)
      ..writeByte(2)
      ..write(obj.deviceType)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.startTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
