// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservationModelAdapter extends TypeAdapter<ReservationModel> {
  @override
  final int typeId = 1;

  @override
  ReservationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReservationModel(
      id: fields[0] as String,
      deviceId: fields[1] as String,
      startTime: fields[2] as DateTime,
      endTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ReservationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.deviceId)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
