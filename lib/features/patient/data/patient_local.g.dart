// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatientLocalAdapter extends TypeAdapter<PatientLocal> {
  @override
  final int typeId = 0;

  @override
  PatientLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientLocal(
      clientUuid: fields[0] as String,
      name: fields[1] as String,
      age: fields[2] as int,
      village: fields[3] as String,
      phone: fields[4] as String?,
      facilityId: fields[5] as String,
      synced: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PatientLocal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.clientUuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.village)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.facilityId)
      ..writeByte(6)
      ..write(obj.synced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
